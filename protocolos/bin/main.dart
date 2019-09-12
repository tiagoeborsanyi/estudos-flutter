import 'package:protocolos/bd.dart' as bd;
import 'dart:async';
import 'package:mysql1/mysql1.dart';

main() async {
  var conn = await bd.createConnection();
  await createTable(conn);
  await insertData(conn);
  await conn.close();
}

Future<void> insertData(MySqlConnection conn) async {
  print('Inserindo dados...');
  var data = [
    ['Tiago', 23],
    ['Mariana', 45],
    ['Rodrigo', 23]
  ];
  
  await conn.queryMulti('insert into people (name, age) values (?, ?)', data);
  print('Dados inseridos com sucesso.');
}

Future<void> createTable(MySqlConnection conn) async {
  print('Criando tabela...');
  await conn.query('CREATE TABLE IF NOT EXISTS people (id INTEGER NOT NULL auto_increment, name VARCHAR(255), age INTEGER, PRIMARY KEY (id))');
  print('Tabela criada com sucesso!');
}
