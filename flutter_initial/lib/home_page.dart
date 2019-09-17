

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
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons()
        ],
      )
    );
  }

  Container _pageView() {
    return Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          height: 300,
          child: PageView(
            children: <Widget>[
              _img("assets/images/dog1.png"),
              _img("assets/images/dog2.png"),
              _img("assets/images/dog3.png"),
              _img("assets/images/dog4.png"),
              _img("assets/images/dog5.png"),
            ],
          ),
        );
  }

 _buttons() {
    return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("List View"),
                _button("Page 2"),
                _button("Page 3"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("Snack"),
                _button("Dialog"),
                _button("Toast"),
              ],
            )
          ],
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

  _button(String text) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: () => _onClickOk()
    );
  }

  void _onClickOk() {
    print("OK!");
  }

  _img(String img) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}