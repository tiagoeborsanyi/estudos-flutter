
import 'dart:async';

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/utils/network.dart';

class CarrosBloc {

  final _streamController = StreamController<List<Carro>>();

  Stream<List<Carro>> get stream => _streamController.stream;
  get close => _streamController.close();

  // ignore: missing_return
  Future<List<Carro>> fetch(String tipo) async {

    try {

      bool networkOn = await isNetworkOn();

      if (!networkOn) {
        List<Carro> carros = await CarroDAO().findAllByTipo(tipo);
        _streamController.add(carros);
        return carros;
      }
      List<Carro> carros = await CarrosApi.getCarros(tipo);

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