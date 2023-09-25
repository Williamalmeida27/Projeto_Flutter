import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/repositories/viacep_repository.dart';

import '../model/viacep_model.dart';

class ViaCepHttp extends StatefulWidget {
  const ViaCepHttp({super.key});

  @override
  State<ViaCepHttp> createState() => _ViaCepHttpState();
}

class _ViaCepHttpState extends State<ViaCepHttp> {
  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viaCepRepository = ViaCepRepository();
  var viaCepModel = ViaCepModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: () async {}),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "CONSULTA CEP:",
              style: TextStyle(fontSize: 25),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: cepController,
              onChanged: (String value) async {
                var cep = value.replaceAll(RegExp(r'[^0-9]'), '');

                if (cep.length == 8) {
                  setState(() {
                    loading = true;
                  });
                  viaCepModel = await viaCepRepository.consultaCEP(cep);
                }
                setState(() {
                  loading = false;
                });
              },
            ),
            Center(
              child: Text(
                viaCepModel.logradouro ?? '',
                style: const TextStyle(fontSize: 22),
              ),
            ),
            Text(
              "${viaCepModel.localidade ?? ''} - ${viaCepModel.uf ?? ''}",
              style: const TextStyle(fontSize: 22),
            ),
            Visibility(
                visible: loading, child: const CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
