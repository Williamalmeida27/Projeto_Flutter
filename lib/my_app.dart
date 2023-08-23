import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/login_page.dart';

class MyApp extends StatelessWidget {
  //Classe estado incial, não sofre alteração
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Criado para chama uma classe que seja stateful para sofre alterações
    return MaterialApp(
      //Aqui alteramos informações principais do visual e chamamos pages.
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, textTheme: GoogleFonts.robotoTextTheme()),
      home: const LoginPage(),
    );
  }
}
