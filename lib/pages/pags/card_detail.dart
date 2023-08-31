import 'package:flutter/material.dart';
import 'package:my_app/model/card_detail_model.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;
  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
                Row(
                  children: [
                    Image.network(
                      cardDetail.url,
                      height: 100,
                    ),
                  ],
                ),
                Text(
                  cardDetail.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    cardDetail.text,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
