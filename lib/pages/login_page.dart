import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 233, 236),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Icon(
                Icons.person_2_outlined,
                size: 170,
                color: Color.fromARGB(255, 44, 137, 33),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                width: double.infinity,
                height: 30,
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Row(
                  children: [
                    Expanded(flex: 2, child: Text("Informe seu e-mail:")),
                    Expanded(flex: 3, child: Text("E-mail")),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 30,
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Row(
                  children: [
                    Expanded(flex: 2, child: Text("Informe sua senha:")),
                    Expanded(flex: 3, child: Text("Senha")),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Container(
                width: double.infinity,
                color: Colors.green,
                height: 30,
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Text("Login"),
              ),
              Container(
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Text("Cadastre-se"),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
