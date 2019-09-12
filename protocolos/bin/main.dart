import 'package:protocolos/bd.dart' as bd;
import 'package:mysql1/mysql1.dart';

main() async {
  var conn = await bd.createConnection();
  await createTable(conn);
  await conn.close();
}

Future<void> createTable(MySqlConnection conn) async {
  print('Criando tabela...');
  await conn.query('CREATE TABLE IF NOT EXISTS people (id INTEGER NOT NULL auto_increment, name VARCHAR(255), age INTEGER, PRIMARY KEY (id))');
  print('Tabela criada com sucesso!');
}
