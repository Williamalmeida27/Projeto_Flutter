import 'package:flutter/material.dart';
import 'package:my_app/pages/shared/app_imagens.dart';

class ListViewHorizontal extends StatelessWidget {
  const ListViewHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(elevation: 8, child: Image.asset(AppImagens.paisagem1)),
                  Card(elevation: 8, child: Image.asset(AppImagens.paisagem2)),
                  Card(elevation: 8, child: Image.asset(AppImagens.paisagem3))
                ],
              ),
            ),
            Expanded(flex: 3, child: Container()),
          ],
        ),
      ),
    );
  }
}
