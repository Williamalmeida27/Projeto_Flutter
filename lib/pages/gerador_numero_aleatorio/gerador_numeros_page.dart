import 'package:flutter/material.dart';
import 'package:my_app/service/app_storage_service.dart';
import 'package:my_app/service/gerador_numero_aleatorio_service.dart';

class GeradorNumeroAleatoriosPage extends StatefulWidget {
  const GeradorNumeroAleatoriosPage({super.key});

  @override
  State<GeradorNumeroAleatoriosPage> createState() =>
      _GeradorNumeroAleatoriosPageState();
}

class _GeradorNumeroAleatoriosPageState
    extends State<GeradorNumeroAleatoriosPage> {
  int? gerarNumeroAleatorio = 0;
  int? quatidadesDeCliques = 0;
  final CHAVE_GERADOR_NUMERO = "gerarNumeroAleatorio";
  final CHAVE_QUATIDADE_CLIQUES = "quatidadesDeCliques";
  StorageService storage = StorageService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    gerarNumeroAleatorio = await storage.getGeradorDeNumeroAleatorio();
    quatidadesDeCliques = await storage.getQuantidadeCliques();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerador números aleatórios"),
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
              quatidadesDeCliques = (quatidadesDeCliques ?? 0) + 1;
              gerarNumeroAleatorio =
                  GeradorNumeroAleatorioService.numeroGeradoAleatorio(1000);
            });
            await storage.setGeradorDeNumeroAleatorio(gerarNumeroAleatorio!);
            await storage.setQuantidadeCliques(quatidadesDeCliques!);
          }),
    );
  }
}
