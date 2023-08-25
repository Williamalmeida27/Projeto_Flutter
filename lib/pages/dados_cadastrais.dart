import 'package:flutter/material.dart';
import 'package:my_app/pages/shared/widgets/label_text.dart';
import 'package:my_app/repositories/linguagem_repository.dart';
import 'package:my_app/repositories/niveil_repository.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({super.key});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController dataNascimentoController =
      TextEditingController(text: "");
  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelecionado = "";
  var liguagemRepository = LinguagemRepository();
  var linguagens = [];
  var linguagensSelecionada = [];
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;
  bool salvando = false;

  @override
  void initState() {
    // TODO: implement initState
    niveis = nivelRepository.retornaNivel();
    linguagens = liguagemRepository.ListaLinguagens();
    super.initState();
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
                      }
                    },
                  ),
                  const LabelTexto(texto: 'Experiencias'),
                  Column(
                    children: niveis
                        .map((nivel) => RadioListTile(
                            dense: true,
                            title: Text(nivel.toString()),
                            selected: nivelSelecionado == nivel,
                            value: nivel.toString(),
                            groupValue: nivelSelecionado,
                            onChanged: (value) {
                              setState(() {
                                nivelSelecionado = value.toString();
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
                              value: linguagensSelecionada.contains(linguagem),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    linguagensSelecionada.add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    linguagensSelecionada.remove(linguagem);
                                  });
                                }
                              }))
                          .toList()),
                  const LabelTexto(texto: "Tempo de Experiencia"),
                  DropdownButton(
                      isExpanded: true,
                      value: tempoExperiencia,
                      items: returnItemDropDown(20),
                      onChanged: (value) {
                        setState(() {
                          tempoExperiencia = value!.toInt();
                        });

                        print(tempoExperiencia);
                      }),
                  LabelTexto(
                      texto:
                          "Pretensão Salarial R\$ ${salarioEscolhido.round()}"),
                  Slider(
                      divisions: 10,
                      min: 0,
                      max: 10000,
                      value: salarioEscolhido,
                      onChanged: (value) {
                        setState(() {
                          salarioEscolhido = value;
                        });
                      }),
                  TextButton(
                      onPressed: () {
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
                        } else if (nivelSelecionado.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Selecione uma experência")));
                          return;
                        } else if (linguagensSelecionada.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Selecione pelo menos uma linguagem")));
                          return;
                        } else if (tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Tempo de experiência deve ser maior que zero")));
                          return;
                        } else if (salarioEscolhido == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Pretensal salarial deve ser maior que zero")));
                          return;
                        }
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
