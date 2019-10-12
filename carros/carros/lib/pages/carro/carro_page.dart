import 'package:carros/pages/carro/carro.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarroPage extends StatelessWidget {
  Carro carro;

  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Image.network(carro.urlFoto),
    );
  }
}
