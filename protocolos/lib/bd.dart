import 'dart:async';
import 'package:mysql1/mysql1.dart';

Future createConnection() async {
    var s = ConnectionSettings(
      host: "localhost",
      port: 3306,
      user: "root",
      db: "teste",
    );
    return await MySqlConnection.connect(s);
}