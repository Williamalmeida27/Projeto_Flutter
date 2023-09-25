// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:my_app/service/gerador_numero_aleatorio_service.dart';
import 'package:hive/hive.dart';

class GeradorNumeroAleatoriosHivePage extends StatefulWidget {
  const GeradorNumeroAleatoriosHivePage({super.key});

  @override
  State<GeradorNumeroAleatoriosHivePage> createState() =>
      _GeradorNumeroAleatoriosHivePageState();
}

class _GeradorNumeroAleatoriosHivePageState
    extends State<GeradorNumeroAleatoriosHivePage> {
  int gerarNumeroAleatorio = 0;
  int quatidadesDeCliques = 0;
  final CHAVE_GERADOR_NUMERO = "gerarNumeroAleatorio";
  final CHAVE_QUATIDADE_CLIQUES = "quatidadesDeCliques";
  late Box box_numero_aleatorio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    if (Hive.isBoxOpen("box_numero_aleatorio")) {
      box_numero_aleatorio = Hive.box('box_numero_aleatorio');
    } else {
      box_numero_aleatorio = await Hive.openBox("box_numero_aleatorio");
    }
    gerarNumeroAleatorio =
        box_numero_aleatorio.get("gerarNumeroAleatorio") ?? 0;
    quatidadesDeCliques = box_numero_aleatorio.get("quatidadesDeCliques") ?? 0;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerador números aleatórios Hive"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Número gerado aleatóriamente: "),
                Text(null == gerarNumeroAleatorio
                    ? "Nenhum número"
                    : gerarNumeroAleatorio.toString()),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(quatidadesDeCliques == null
                ? 'Nenhum clique efetuado'
                : "Quantas vezes o botão foi clicado: $quatidadesDeCliques")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            setState(() {
              quatidadesDeCliques = quatidadesDeCliques + 1;
              gerarNumeroAleatorio =
                  GeradorNumeroAleatorioService.numeroGeradoAleatorio(1000);
            });
            await box_numero_aleatorio.put(
                "quatidadesDeCliques", quatidadesDeCliques);
            await box_numero_aleatorio.put(
                "gerarNumeroAleatorio", gerarNumeroAleatorio);
          }),
    );
  }
}
