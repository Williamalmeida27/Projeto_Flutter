import 'package:flutter/material.dart';

class DadosCadastrais extends StatelessWidget {
  final String nomeTitulo;
  final List<String> meusDados;
  const DadosCadastrais(
      {super.key, required this.nomeTitulo, required this.meusDados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomeTitulo),
      ),
      body: Center(
          child: Text(
        meusDados.length.toString(),
        style: const TextStyle(fontSize: 26),
      )),
    );
  }
}
