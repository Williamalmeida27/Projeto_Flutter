import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/card_page.dart';
import 'package:my_app/pages/clima_page.dart';
import 'package:my_app/pages/pags/list_view_v.dart';
import 'package:my_app/pages/pags/list_view_h.dart';
import 'package:my_app/pages/shared/widgets/custom_drawer.dart';
import 'package:my_app/pages/tarefa/tarefa_hive_page.dart';
import 'package:my_app/pages/tarefa/tarefa_sqllite_page.dart';
import 'package:my_app/pages/via_cep_http.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    TarefaSqlitePage(),
                    ViaCepHttp(),
                    ClimaPage()
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
                        icon: FaIcon(FontAwesomeIcons.house), label: "Pag1"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_2), label: "Pag2"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add), label: "Pag3"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.list), label: "Pag4"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.download), label: "Pag5"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.temple_buddhist), label: "Pag6")
                  ])
            ],
          )),
    );
  }
}
