import 'package:carros/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        centerTitle: true,
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  _body() {
    return Center(
      child: Text(
        "Home Page",
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}
