import 'package:flutter/material.dart';
import 'package:my_app/pages/login_page.dart';

import '../../dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                      builder: (context) => const DadosCadastrais()));
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
                    "Acto 2",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            onTap: () {},
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
