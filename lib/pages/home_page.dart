import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/pags/card_page.dart';
import 'package:my_app/pages/pags/list_view_v.dart';
import 'package:my_app/pages/pags/list_view_h.dart';
import 'package:my_app/pages/shared/widgets/custom_drawer.dart';
import 'package:my_app/pages/tarefa_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController paginaController = PageController(initialPage: 0);
  int posicaoPag = 0;

  @override
  Widget build(BuildContext context) {
    //A parte daqui podemos adicionar junto ao scaffold dados na tela
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: Text(
            "My App",
            style: GoogleFonts.acme(fontSize: 20),
          )),
          drawer: const CustomDrawer(),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: paginaController,
                  onPageChanged: (value) {
                    setState(() {
                      posicaoPag = value;
                    });
                  },
                  children: const [
                    CardPage(),
                    ListViewVertical(),
                    ListViewHorizontal(),
                    TarefaPage()
                  ],
                ),
              ),
              BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  onTap: (value) {
                    paginaController.jumpToPage(value);
                  },
                  currentIndex: posicaoPag,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Pag1"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_2), label: "Pag2"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add), label: "Pag3"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.list), label: "Pag4")
                  ])
            ],
          )),
    );
  }
}
