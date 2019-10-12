
import 'dart:async';

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';

class CarrosBloc {

  final _streamController = StreamController<List<Carro>>();

  Stream<List<Carro>> get stream => _streamController.stream;
  get close => _streamController.close();

  // ignore: missing_return
  Future<List<Carro>> fetch(String tipo) async {

    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);

      _streamController.add(carros);

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