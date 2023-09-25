import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:intl/intl.dart';

class BrasilFieldsPage extends StatefulWidget {
  const BrasilFieldsPage({super.key});

  @override
  State<BrasilFieldsPage> createState() => _BrasilFieldsPageState();
}

class _BrasilFieldsPageState extends State<BrasilFieldsPage> {
  TextEditingController controllerCep = TextEditingController();
  TextEditingController controllerCpf = TextEditingController();
  TextEditingController controllertelefone = TextEditingController();
  bool isvalid = false;
  var padraoUS = NumberFormat('###.0#', 'en_US');
  var padraoPT = NumberFormat('###.0#', 'pt_BR');
  var padraUSData = DateFormat('EEEEE', 'en_US').format(DateTime(2023, 9, 7));
  var padraPTData = DateFormat('EEEEE', 'pt_BR').format(DateTime(2023, 9, 7));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("CEP: "),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: controllerCep,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),
            Text("CPF/CNPJ: ${controllerCpf.text}"),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controllerCpf,
                    inputFormatters: [
                      // obrigatório
                      FilteringTextInputFormatter.digitsOnly,
                      CpfOuCnpjFormatter(),
                    ],
                    onChanged: (value) {
                      controllerCpf.text = value;
                      isvalid = CPFValidator.isValid(controllerCpf.text);
                      setState(() {});
                    },
                  ),
                ),
                Expanded(
                    child: FaIcon(
                  FontAwesomeIcons.check,
                  color: isvalid == false ? Colors.grey : Colors.green,
                ))
              ],
            ),
            const Text("Telefone: "),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: controllertelefone,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text(padraoPT.format(12.455))),
                Expanded(child: Text(padraoUS.format(12.455)))
              ],
            ),
            Row(
              children: [
                Expanded(child: Text(padraPTData)),
                Expanded(child: Text(padraUSData))
              ],
            ),
            Row(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
