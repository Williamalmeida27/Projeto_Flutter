import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/dados_cadastrais.dart';
import 'package:my_app/pages/pags/pagina1_page.dart';
import 'package:my_app/pages/pags/pagina2_page.dart';
import 'package:my_app/pages/pags/pagina3_page.dart';

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
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      width: double.infinity,
                      child: const Text(
                        "Cadastro",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DadosCadastrais(
                                    nomeTitulo: 'Meus Dados',
                                    meusDados: ["Dado 1"],
                                  )));
                    },
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      width: double.infinity,
                      child: const Text(
                        "Acto 2",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      width: double.infinity,
                      child: const Text(
                        "Acto 3",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
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
                  scrollDirection: Axis.vertical,
                  children: const [Pagina1Page(), Pagina2Page(), Pagina3Page()],
                ),
              ),
              BottomNavigationBar(
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
                  ])
            ],
          )),
    );
  }
}
