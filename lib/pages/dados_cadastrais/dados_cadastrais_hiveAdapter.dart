import 'package:flutter/material.dart';
import 'package:my_app/model/dados_cadastrais_model.dart';
import 'package:my_app/pages/shared/widgets/label_text.dart';
import 'package:my_app/repositories/dados_cadastrais_repository.dart';
import 'package:my_app/repositories/linguagem_repository.dart';
import 'package:my_app/repositories/niveil_repository.dart';

class DadosCadastraisHiveAdapterPage extends StatefulWidget {
  const DadosCadastraisHiveAdapterPage({super.key});

  @override
  State<DadosCadastraisHiveAdapterPage> createState() =>
      _DadosCadastraisHiveAdapterPageState();
}

class _DadosCadastraisHiveAdapterPageState
    extends State<DadosCadastraisHiveAdapterPage> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController dataNascimentoController =
      TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var niveis = [];
  var liguagemRepository = LinguagemRepository();
  var linguagens = [];
  bool salvando = false;
  late DadosCadastraisRepository dadosCadastraisRepository;
  var dadosCadastraisModel = DadosCadastraisModel.vazio();

  @override
  void initState() {
    niveis = nivelRepository.retornaNivel();
    linguagens = liguagemRepository.ListaLinguagens();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastraisModel = dadosCadastraisRepository.obterDados();
    nomeController.text = dadosCadastraisModel.nome ?? "";
    dataNascimentoController.text = dadosCadastraisModel.dataNascimento == null
        ? ""
        : dadosCadastraisModel.dataNascimento.toString();

    setState(() {});
  }

  List<DropdownMenuItem<int>> returnItemDropDown(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Dados"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: salvando
              ? const Center(child: CircularProgressIndicator())
              : ListView(children: [
                  const LabelTexto(texto: 'Nome'),
                  TextField(
                    controller: nomeController,
                  ),
                  const LabelTexto(texto: 'Data Nascimento'),
                  TextField(
                    controller: dataNascimentoController,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1930, 1, 1),
                          lastDate: DateTime(2119, 10, 10));
                      if (data != null) {
                        dataNascimentoController.text = data.toString();
                        dadosCadastraisModel.dataNascimento = data;
                      }
                    },
                  ),
                  const LabelTexto(texto: 'Experiencias'),
                  Column(
                    children: niveis
                        .map((nivel) => RadioListTile(
                            dense: true,
                            title: Text(nivel.toString()),
                            selected:
                                dadosCadastraisModel.nivelExperiencia == nivel,
                            value: nivel.toString(),
                            groupValue: dadosCadastraisModel.nivelExperiencia,
                            onChanged: (value) {
                              setState(() {
                                dadosCadastraisModel.nivelExperiencia =
                                    value.toString();
                              });

                              print(value);
                            }))
                        .toList(),
                  ),
                  const LabelTexto(texto: 'Linguagens'),
                  Column(
                      children: linguagens
                          .map((linguagem) => CheckboxListTile(
                              title: Text(linguagem),
                              value: dadosCadastraisModel.linguagens
                                  .contains(linguagem),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    dadosCadastraisModel.linguagens
                                        .add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    dadosCadastraisModel.linguagens
                                        .remove(linguagem);
                                  });
                                }
                              }))
                          .toList()),
                  const LabelTexto(texto: "Tempo de Experiencia"),
                  DropdownButton(
                      isExpanded: true,
                      value: dadosCadastraisModel.tempoExperiencia,
                      items: returnItemDropDown(20),
                      onChanged: (value) {
                        setState(() {
                          dadosCadastraisModel.tempoExperiencia =
                              value!.toInt();
                        });
                      }),
                  LabelTexto(
                      texto:
                          "Pretensão Salarial R\$ ${dadosCadastraisModel.salario?.round()}"),
                  Slider(
                      divisions: 10,
                      min: 0,
                      max: 10000,
                      value: dadosCadastraisModel.salario ?? 0,
                      onChanged: (value) {
                        setState(() {
                          dadosCadastraisModel.salario = value;
                        });
                      }),
                  TextButton(
                      onPressed: () async {
                        setState(() {
                          salvando = false;
                        });
                        if (nomeController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("O nome não pode ser vazio")));
                          return;
                        } else if (dataNascimentoController.text
                            .trim()
                            .isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Data de nascimento obrigatória")));
                          return;
                        } else if (dadosCadastraisModel
                            .nivelExperiencia!.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Selecione uma experência")));
                          return;
                        } else if (dadosCadastraisModel.linguagens.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Selecione pelo menos uma linguagem")));
                          return;
                        } else if (dadosCadastraisModel.tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Tempo de experiência deve ser maior que zero")));
                          return;
                        } else if (dadosCadastraisModel.salario == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Pretensal salarial deve ser maior que zero")));
                          return;
                        }
                        dadosCadastraisModel.nome = nomeController.text;
                        dadosCadastraisRepository.salvar(dadosCadastraisModel);

                        setState(() {
                          salvando = true;
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Salvando...")));
                        });
                        Future.delayed(const Duration(seconds: 4), () {
                          setState(() {
                            salvando = false;
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Dados salvo com sucesso!")));
                          }); // Prints after 1 second.
                        });
                      },
                      child: const Text("Salvar"))
                ])),
    );
  }
}
