import 'package:flutter/material.dart';
import 'package:my_app/model/back4app/tarefas_back4_app_model.dart';
import 'package:my_app/repositories/back4app_repository/back4_app_repository.dart';

class TarefaHttpPage extends StatefulWidget {
  const TarefaHttpPage({super.key});

  @override
  State<TarefaHttpPage> createState() => _TarefaHttpPageState();
}

class _TarefaHttpPageState extends State<TarefaHttpPage> {
  Back4AppRepository tarefaRepository = Back4AppRepository();
  var _listaTarefas = TarefasBack4AppModel([]);
  var descricaoController = TextEditingController();
  bool tarefasNaoConcluidas = false;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarTarefa();
  }

  void carregarTarefa() async {
    setState(() {
      loading = true;
    });
    _listaTarefas = await tarefaRepository.obterTarefas(tarefasNaoConcluidas);

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas Http"),
      ),
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
                            await tarefaRepository.criarTarefa(
                                TarefaBack4AppModel.criar(
                                    descricaoController.text, false));
                            Navigator.pop(context);
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
                  itemCount: _listaTarefas.tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var tarefa = _listaTarefas.tarefas[index];
                    return Dismissible(
                      key: Key(tarefa.descricao),
                      onDismissed: (DismissDirection dismissDirection) {
                        tarefaRepository.removerTarefa(tarefa.objectId);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(tarefa.descricao),
                          Switch(
                              value: tarefa.concluido,
                              onChanged: (value) async {
                                tarefa.concluido = value;
                                await tarefaRepository.atualizarTarefa(tarefa);
                                carregarTarefa();
                                ;
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
