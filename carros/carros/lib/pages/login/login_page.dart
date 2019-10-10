import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/carro/home_page.dart';
import 'package:carros/pages/login/login_api.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:carros/utils/alert.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController(text: "user");

  final _tSenha = TextEditingController(text: "123");

  final _focusSenha = FocusNode();

  bool _showProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText(
              "Login",
              "digite o login",
              controller: _tLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              "Senha",
              "digite a senha",
              password: true,
              controller: _tSenha,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            AppButton(
              "Login",
              onPressed: _onClickLogin,
              showProgress: _showProgress,
            )
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    bool formOk = _formKey.currentState.validate();
    if (!formOk) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    setState(() {
      _showProgress = true;
    });

    ApiResponse response = await LoginApi.login(login, senha);
    if (response.ok) {
      Usuario user = response.result;

//      print(">>> $user");
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }
    setState(() {
      _showProgress = false;
    });
  }

  String _validateLogin(String value) {
    if (value.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validateSenha(String value) {
    if (value.isEmpty) {
      return "Digite a senha";
    }
    return null;
  }
}
