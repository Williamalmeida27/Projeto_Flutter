import 'package:flutter/material.dart';
import 'package:my_app/pages/shared/app_imagens.dart';

class ListViewVertical extends StatelessWidget {
  const ListViewVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImagens.user2),
          title: const Text("Bem vindo"),
          subtitle: const Text("Novo"),
          trailing: PopupMenuButton<String>(onSelected: (menu) {
            if (menu == "opcao2") {
              print(menu);
            }
          }, itemBuilder: (BuildContext bc) {
            return <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                  value: "opcao1", child: Text("Opção 1")),
              const PopupMenuItem<String>(
                  value: "opcao2", child: Text("Opção 2")),
              const PopupMenuItem<String>(
                  value: "opcao3", child: Text("Opção 3")),
            ];
          }),
        ),
        Image.asset(AppImagens.user1),
        Image.asset(AppImagens.user2),
        Image.asset(AppImagens.user3),
        Image.asset(AppImagens.paisagem1),
        Image.asset(AppImagens.paisagem2),
        Image.asset(AppImagens.paisagem3)
      ],
    );
  }
}
