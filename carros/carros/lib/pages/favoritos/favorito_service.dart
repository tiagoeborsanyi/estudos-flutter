
import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/favoritos/favorito.dart';
import 'package:carros/pages/favoritos/favorito_dao.dart';

class FavoritoService {
  static favoritar (Carro c) {

    Favorito f = Favorito.fromCarro(c);

    final dao = FavoritoDAO();

    dao.save(f);

  }
}