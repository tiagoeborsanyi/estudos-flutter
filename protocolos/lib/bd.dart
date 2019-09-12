import 'package:mysql1/mysql1.dart';

createConnection() async {
    var s = ConnectionSettings(
      user: "root",
//      password: "",
      host: "localhost",
      port: 3306,
      db: "teste",
    );
    return await MySqlConnection.connect(s);
}