import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/login_page.dart';

class SplashAnimitedPage extends StatefulWidget {
  const SplashAnimitedPage({super.key});

  @override
  State<SplashAnimitedPage> createState() => _SplashAnimitedPageState();
}

class _SplashAnimitedPageState extends State<SplashAnimitedPage> {
  openSplash() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }); //Forma de criar uma tempo de entrada no app e redirecionar
  }

  @override
  Widget build(BuildContext context) {
    // openSplash();
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.red, Colors.blue])),
          child: Center(
            child: SizedBox(
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Agne',
                ),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText('Bem vindo ao meu APP'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                  onFinished: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
