import 'package:carros/pages/login_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Tiago Emerick"),
              accountEmail: Text("tiago@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk992R4iDaRuEKOlbVHGSF8t4BNJ47ePtklkzSy95H0uyv8O5wfg'),
              ),
            ),
            ListTile(
                leading: Icon(Icons.star),
                title: Text("Favoritos"),
                subtitle: Text("mais informações..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("TAP");
                  Navigator.pop(context);
                }
            ),
            ListTile(
                leading: Icon(Icons.help),
                title: Text("Ajuda"),
                subtitle: Text("mais informações..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("TAP");
                  Navigator.pop(context);
                }
            ),
            ListTile(
                leading: Icon(Icons.loop),
                title: Text("Logout"),
                subtitle: Text("mais informações..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => _onClickLogout(context)
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}