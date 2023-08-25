import 'package:flutter/material.dart';

class LabelTexto extends StatelessWidget {
  final String texto;
  const LabelTexto({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Text(texto,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
    );
  }
}
