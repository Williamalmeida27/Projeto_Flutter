import 'package:flutter/material.dart';
import 'package:my_app/model/tarefa_hive_model.dart';
import 'package:my_app/model/tarefa_sqllite_model.dart';
import 'package:my_app/repositories/sql/tarefa_sqllite_repository.dart';
import 'package:my_app/repositories/tarefa_hive_repository.dart';

class TarefaSqlitePage extends StatefulWidget {
  const TarefaSqlitePage({super.key});

  @override
  State<TarefaSqlitePage> createState() => _TarefaSqlitePageState();
}

class _TarefaSqlitePageState extends State<TarefaSqlitePage> {
  TarefaSQLiteRepository tarefaRepository = TarefaSQLiteRepository();
  var _tarefas = <TarefaSQLiteModel>[];
  var descricaoController = TextEditingController();
  bool tarefasNaoConcluidas = false;

  @override
  void initState() {
    super.initState();
    carregarTarefa();
  }

  void carregarTarefa() async {
    _tarefas = await tarefaRepository.obterTarefas(tarefasNaoConcluidas);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            descricaoController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    child: AlertDialog(
                      title: const Text("Adicionar Tarefa"),
                      content: TextField(
                        controller: descricaoController,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar"),
                        ),
                        TextButton(
                          onPressed: () async {
                            // await tarefaRepository.adicionarTarefa(
                            //     Tarefa(descricaoController.text, false));
                            tarefaRepository.salvar(TarefaSQLiteModel(
                                0, descricaoController.text, false));
                            Navigator.pop(context);
                            carregarTarefa();
                            setState(() {});
                          },
                          child: const Text("Salvar"),
                        )
                      ],
                    ),
                  );
                });
          }),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filtrar não conluídos"),
                  Switch(
                      value: tarefasNaoConcluidas,
                      onChanged: (value) {
                        tarefasNaoConcluidas = value;
                        carregarTarefa();
                      })
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var tarefa = _tarefas[index];
                    return Dismissible(
                      key: Key(tarefa.descricao!),
                      onDismissed: (DismissDirection dismissDirection) {
                        // tarefaRepository.removerTarefa(tarefa.id);
                        tarefaRepository.remover(tarefa.id);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(tarefa.descricao!),
                          Switch(
                              value: tarefa.concluido,
                              onChanged: (value) async {
                                // await tarefaRepository.alterarTarefa(
                                // tarefa.id, value);
                                tarefa.concluido = value;
                                tarefaRepository.atualizar(tarefa);
                                carregarTarefa();
                              })
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
