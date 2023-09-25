import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/pages/auto_size_text/auto_size_text_page.dart';
import 'package:my_app/pages/bottom_bar_customizado/bottom_bar_customizado_page.dart';
import 'package:my_app/pages/configuracoes_page.dart';
import 'package:my_app/pages/dados_cadastrais/dados_cadastrais_hiveAdapter.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/pages/indicador_progresso/progress_indicator_page.dart';
import 'package:my_app/pages/tarefa/tarefa_http_page.dart';
import 'package:my_app/repositories/back4app_repository/back4_app_repository.dart';
import 'package:my_app/repositories/marvel_repository/caracters_repository.dart';

import '../../caracters/caracter_page.dart';
import '../../gerador_numero_aleatorio/gerador_numeros_hive_page.dart';
import '../../posts_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Camera"),
                          leading: const Icon(Icons.photo_camera_back),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Galeria"),
                          leading: const Icon(Icons.photo_album),
                        )
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                    "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                  ),
                ),
                accountName: const Text("Meu nome"),
                accountEmail: const Text("Meuemail@email.com")),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Cadastro",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const DadosCadastraisHiveAdapterPage()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.mobile_friendly),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Configuracoes",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) => const ConfiguracoesPage()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.admin_panel_settings),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Gerador de Números Aleatórios",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) =>
                          const GeradorNumeroAleatoriosHivePage()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.post_add),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Posts",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) => const PostsPage()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.barsProgress,
                    color: Color.fromARGB(255, 64, 96, 176),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Progress Indicator",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) =>
                          const ProgressIndicatorPage()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.textWidth,
                    color: Color.fromARGB(255, 64, 96, 176),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Auto Size Text",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) => const AutoSizeTextPage()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.post_add),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Heros",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) => const CaracterPages()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  FaIcon(FontAwesomeIcons.bars),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "BottomBar customizado",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) =>
                          const BottomBarCustomizadoPage()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.post_add),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Lista Tarefas back4App",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) => const TarefaHttpPage()));
            },
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext) {
                    return Wrap(
                      children: [
                        Column(
                          children: [
                            const Text("Bem vindo"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(Icons.more)),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(Icons.cancel))
                              ],
                            )
                          ],
                        )
                      ],
                    );
                  });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.privacy_tip),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Termos de uso e privacidade",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sair",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      title: const Text(
                        "Meu App",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      content: const Wrap(
                        children: [
                          Text("Você clicou em SAIR."),
                          Text("Deseja realmente sair do aplicativo?")
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext bc) =>
                                          const LoginPage()));
                            },
                            child: const Text(
                              "Sim",
                              style: TextStyle(fontSize: 12),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Não",
                                style: TextStyle(fontSize: 12)))
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
