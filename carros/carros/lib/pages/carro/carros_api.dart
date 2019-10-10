
import 'package:carros/pages/carro/carro.dart';

class CarrosApi {
  static List<Carro> getCarros() {
    final carros = List<Carro>();

    carros.add(Carro(nome: "Cadillac Deville Convertible", urlFoto: "http://www.livroandroid.com.br/livro/carros/classicos/Cadillac_Deville_Convertible.png"));
    carros.add(Carro(nome: "Ferrari 250 GTO", urlFoto: "http://www.livroandroid.com.br/livro/carros/classicos/Ferrari_250_GTO.png"));
    carros.add(Carro(nome: "Camaro SS 1969", urlFoto: "http://www.livroandroid.com.br/livro/carros/classicos/Camaro_SS.png"));

    return carros;
  }
}