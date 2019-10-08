import 'package:flutter/material.dart';
import 'package:flutter_initial/pages/hello_listview.dart';
import 'package:flutter_initial/pages/hello_page1.dart';
import 'package:flutter_initial/pages/hello_page2.dart';
import 'package:flutter_initial/pages/hello_page3.dart';
import 'package:flutter_initial/utils/nav.dart';
import 'package:flutter_initial/widgets/blue_button.dart';
import 'package:flutter_initial/widgets/drawer_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Hello Flutter"),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(text: "TAB 1"),
              Tab(text: "TAB 2"),
              Tab(text: "TAB 3"),
            ]),
          ),
          body: TabBarView(children: [
            _body(context),
            Container(
              color: Colors.green
            ),
            Container(
                color: Colors.yellowAccent
            ),
          ]),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    _onclickFab();
                  }),
              SizedBox(
                width: 16,
              ),
              FloatingActionButton(
                  child: Icon(Icons.favorite),
                  onPressed: () {
                    _onclickFab();
                  }),
            ],
          ),
          drawer: DrawerList(

          ),
      ),
    );
  }

  _body(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(),
          ],
        ));
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
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("Page 2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 3",
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                BlueButton("Toast", onPressed: _onClickToast),
              ],
            )
          ],
        );
      },
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(">> $s");
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Olá Flutterr'),
        action: SnackBarAction(
            textColor: Colors.yellow,
            label: "OK",
            onPressed: () {
              print("OK!");
            })));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Flutter é muito legal."),
              actions: <Widget>[
                FlatButton(
                  child: Text("cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                    print("OK!!!");
                  },
                )
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter é legal",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
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

  _img(String img) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }

  _onclickFab() {
    print('Float action button');
  }
}
