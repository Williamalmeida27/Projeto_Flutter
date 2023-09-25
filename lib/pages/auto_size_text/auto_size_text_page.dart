import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizeTextPage extends StatefulWidget {
  const AutoSizeTextPage({super.key});

  @override
  State<AutoSizeTextPage> createState() => _AutoSizeTextPageState();
}

class _AutoSizeTextPageState extends State<AutoSizeTextPage> {
  TextEditingController textoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auto size"),
      ),
      body: Column(
        children: [
          TextField(
            maxLines: 5,
            controller: textoController,
            onChanged: (value) {
              setState(() {});
            },
          ),
          Expanded(
            child: Card(
              child: Container(
                width: double.infinity,
                child: AutoSizeText(
                  textoController.text,
                  style: TextStyle(fontSize: 26),
                  maxLines: 2,
                  minFontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
