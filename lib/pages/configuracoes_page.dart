import 'package:flutter/material.dart';
import 'package:my_app/model/configuracoes_model.dart';
import 'package:my_app/repositories/configuracoes_repository.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  var nomeController = TextEditingController();
  var alturaController = TextEditingController();
  late ConfiguracoesRepository configuracoesRepository;
  var configuracoesModel = ConfiguracoesModel.vazio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    nomeController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.alturaUsuario.toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: Container(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: nomeController,
              decoration: const InputDecoration(hintText: "Nome:"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Altura:"),
            ),
          ),
          SwitchListTile(
              title: const Text("Receber notificação"),
              value: configuracoesModel.receberNotificao,
              onChanged: (value) {
                setState(() {
                  configuracoesModel.receberNotificao = value;
                });
              }),
          SwitchListTile(
              title: const Text("Tema Escuro"),
              value: configuracoesModel.temaEscuro,
              onChanged: (value) {
                setState(() {
                  configuracoesModel.temaEscuro = value;
                });
              }),
          Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 49, 78, 114))),
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();

                    try {
                      configuracoesModel.alturaUsuario =
                          double.parse(alturaController.text);
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              content: Text("Informe uma altura válida"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"))
                              ],
                            );
                          });
                      return;
                    }
                    configuracoesModel.nomeUsuario = nomeController.text;
                    configuracoesRepository.salvar(configuracoesModel);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Salvar",
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      )),
    );
  }
}
