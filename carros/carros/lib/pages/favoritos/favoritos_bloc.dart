
import 'dart:async';

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carro_dao.dart';
import 'package:carros/pages/favoritos/favorito_service.dart';
import 'package:carros/utils/network.dart';

class FavoritosBloc {

  final _streamController = StreamController<List<Carro>>();

  Stream<List<Carro>> get stream => _streamController.stream;
  get close => _streamController.close();

  // ignore: missing_return
  Future<List<Carro>> fetch() async {

    try {

      // ignore: unused_local_variable
      bool networkOn = await isNetworkOn();

      List<Carro> carros = await FavoritoService.getCarros();

      final dao = CarroDAO();

      if (carros.isNotEmpty) {
        // Salva todos os carros no banco de dados local
        carros.forEach((c) => dao.save(c));

        _streamController.add(carros);
      }

      return carros;
    } catch (e) {
      _streamController.addError(e);
    }

  }

  dispose() {
    // ignore: unnecessary_statements
    _streamController.close;
  }

}