import 'package:flutter/material.dart';
import 'package:my_app/model/caracters_model.dart';
import 'package:my_app/repositories/marvel_repository/caracters_repository.dart';

class CaracterPages extends StatefulWidget {
  const CaracterPages({super.key});

  @override
  State<CaracterPages> createState() => _CaracterPagesState();
}

class _CaracterPagesState extends State<CaracterPages> {
  ScrollController _scrollController = ScrollController();
  CaractersModel caractes = CaractersModel();
  late MarvelRepository marvelRepository;
  bool carregando = false;
  int offset = 0;

  @override
  void initState() {
    marvelRepository = MarvelRepository();
    _scrollController.addListener(() {
      var posicaoParaPaginar = _scrollController.position.maxScrollExtent * 0.6;
      if (_scrollController.position.pixels > posicaoParaPaginar) {
        carregarDados();
      }
    });

    super.initState();
    carregarDados();
  }

  carregarDados() async {
    if (carregando) return;
    if (caractes.data == null || caractes.data!.results! == null) {
      caractes = await marvelRepository.obterCaracters(offset);
    } else {
      setState(() {
        carregando = true;
      });
      offset = offset + caractes.data!.count!;
      var tempList = await marvelRepository.obterCaracters(offset);
      caractes.data!.results!.addAll(tempList.data!.results!);
      carregando = false;
    }

    setState(() {});
  }

  int quatidadeTotalHeoris() {
    try {
      return caractes.data!.total!;
    } catch (e) {
      return 0;
    }
  }

  int quatidadeAtualHeoris() {
    try {
      return offset + caractes.data!.count!;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                  "Heroes ${quatidadeAtualHeoris()}/${quatidadeTotalHeoris()}"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: (caractes.data == null ||
                              caractes.data!.results == null)
                          ? 0
                          : caractes.data!.results!.length,
                      itemBuilder: (_, index) {
                        var caracter = caractes.data!.results![index];
                        return Card(
                          elevation: 8,
                          child: Row(
                            children: [
                              Image.network(
                                caracter.thumbnail!.path! +
                                    '.' +
                                    caracter.thumbnail!.extension!,
                                height: 150,
                                width: 150,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      caracter.name!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      caracter.description!.isEmpty
                                          ? "Nenhuma descricao deste personagem"
                                          : caracter.description!,
                                      textAlign: TextAlign.start,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                carregando
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          carregarDados();
                        },
                        child: const Text("Carregar"))
              ],
            )));
  }
}
