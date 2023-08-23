import 'dart:math';

class GeradorNumeroAleatorioService {
  static int numeroGeradoAleatorio(int numeroMax) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(numeroMax);
  }
}
