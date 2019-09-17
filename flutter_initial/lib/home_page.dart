

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
//      margin: EdgeInsets.only(left: 10, top: 10),
      color: Colors.white,
      child: Center(
        child: _img(),
      ),
    );
  }

  _text() {
    return Text(
      'Olá Flutter refatorado',
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.wavy,
        decorationColor: Colors.deepOrange,
      ),
    );
  }

  _img() {
    return Image.asset("assets/images/dog2.png");
  }
}