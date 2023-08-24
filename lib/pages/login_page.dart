import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController =
      TextEditingController(text: "Email@email.com");
  TextEditingController senhaController = TextEditingController(text: "123");
  bool isVisivility = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                        flex: 10,
                        child: Image.network(
                            "https://hermes.digitalinnovation.one/assets/diome/logo.png")),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Column(
                    children: [
                      Text(
                        "Ja tem cadastro?",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Faça seu login e make the change_",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: TextField(
                    controller: emailController,
                    onChanged: (value) {
                      print("Aquie passou o controller de e-mail: $value");
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 150, 44, 179))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 150, 44, 179))),
                      hintText: "E-mail",
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: TextField(
                    controller: senhaController,
                    obscureText: isVisivility,
                    onChanged: (value) =>
                        print("Aqui passou controller de senha $value"),
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 0),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 150, 44, 179))),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 150, 44, 179),
                        )),
                        hintText: "Senha",
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isVisivility = !isVisivility;
                            });
                          },
                          child: Icon(
                            isVisivility
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if (emailController.text.trim() == "Email@email.com" &&
                            senhaController.text.trim() == "123") {
                          //SnackBar retirado para criar navegação
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //         content:
                          //             Text("Login efetuado com sucesso!")));
                          //Navegação
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Erro ao tentar efetuar login")));
                        }
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 150, 44, 179))),
                      child: const Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: const Column(children: [
                    Center(
                      child: Text("Esqueci minha senha",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text("Criar conta",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500)))
                  ]),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
