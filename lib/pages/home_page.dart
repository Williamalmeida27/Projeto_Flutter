import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../service/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numeroGerado = 0;
  int vezesCliclado = 0;

  @override
  Widget build(BuildContext context) {
    //A parte daqui podemos adicionar junto ao scaffold dados na tela
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "My App",
        style: GoogleFonts.acme(fontSize: 20),
      )),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              height: 250,
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                child: Text(
                  "Ações do usuário",
                  style: GoogleFonts.acme(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.indigo,
                width: double.infinity,
                child: Text(
                  "Número de vezes clicado: $vezesCliclado",
                  style: GoogleFonts.acme(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                width: double.infinity,
                child: Text(
                  "Número gerado aleatório: $numeroGerado",
                  style: GoogleFonts.acme(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                          color: Colors.blue,
                          child: Text("10",
                              style: GoogleFonts.acme(fontSize: 20))),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                          color: Colors.red,
                          child: Text("20",
                              style: GoogleFonts.acme(fontSize: 20))),
                    ),
                    Expanded(
                      child: Container(
                          color: Colors.green,
                          child: Text("30",
                              style: GoogleFonts.acme(fontSize: 20))),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_box),
          onPressed: () {
            setState(() {
              vezesCliclado = vezesCliclado + 1;
              numeroGerado =
                  GeradorNumeroAleatorioService.numeroGeradoAleatorio(1000);
            });
          }),
    );
  }
}
