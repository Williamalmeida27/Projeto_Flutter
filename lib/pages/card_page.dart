import 'package:flutter/material.dart';
import 'package:my_app/model/card_detail_model.dart';
import 'package:my_app/pages/pags/card_detail.dart';
import 'package:my_app/repositories/card_detail_repositorie.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetailRepositorio CardDetailRepositorie = CardDetailRepositorio();
  CardDetail? cardDetail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {
    Future.delayed(Duration(milliseconds: 0));
    cardDetail = await CardDetailRepositorie.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: cardDetail == null
              ? const LinearProgressIndicator()
              : InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardDetailPage(
                                  cardDetail: cardDetail!,
                                )));
                  },
                  child: Hero(
                    tag: cardDetail!.id,
                    child: Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  cardDetail!.url,
                                  height: 20,
                                ),
                                Text(
                                  cardDetail!.title,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              cardDetail!.text,
                              textAlign: TextAlign.justify,
                            ),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CardDetailPage(
                                                  cardDetail: cardDetail!,
                                                )));
                                  },
                                  child: const Text(
                                    "LER MAIS",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
