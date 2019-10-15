
import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carro_dao.dart';
import 'package:carros/pages/favoritos/favorito.dart';
import 'package:carros/pages/favoritos/favorito_dao.dart';

class FavoritoService {
  static Future<bool> favoritar (Carro c) async {

    Favorito f = Favorito.fromCarro(c);

    final dao = FavoritoDAO();

    final exists = await dao.exists(c.id);

    if (exists) {
      dao.delete(c.id);
    } else {
      dao.save(f);
      return true;
    }
  }

  static Future<List<Carro>> getCarros() async {
    // select * from carro c, favorito f where c.id = f.id
    List<Carro> carros = await CarroDAO().query('select * from carro c, favorito f where c.id = f.id');

    return carros;
  }

  static Future<bool> isFavorito(Carro c) async {
    final dao = FavoritoDAO();

    bool exists = await dao.exists(c.id);

    return exists;
  }
}