import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

main() {
  //menu();
  print('${Platform.operatingSystem} ${Platform.version}');
  print('Path: ${Platform.script.path}');
}

void menu() {
  print('### Inicio ###');
  print('\nSelecione uma das opções abaixo:');
  print('1 - Ver a cotação de hoje');
  print('2 - Registrar a cotação de hoje');
  print('3 - Ver cotações registradas');

  String option = stdin.readLineSync();

  switch(int.parse(option)) {
    case 1: today(); break;
    case 2: registerData(); break;
    case 3: listData(); break;
    default: print('\n\nops, opção invalida, seleciona algo valido aew'); menu(); break;
  }
}

registerData() async {
  var hgData = await getData();
  dynamic fileData = readFile();

  fileData = (fileData != null && fileData.length > 0 ? json.decode(fileData) : List());

  bool exists = false;

  fileData.forEach((data) {
    if(data['date'] == now())
      exists = true;
  });

  if(!exists) {
    fileData.add({'date': now(), "data": "${hgData['data']}"});

    Directory dir = Directory.current;
    File file = File(dir.path + '/meu_arquivo.txt');
    RandomAccessFile raf = file.openSync(mode: FileMode.write);

    raf.writeStringSync(json.encode(fileData).toString());
    raf.flushSync();
    raf.closeSync();

    print('\n\n## dados salvo com sucesso');
  } else {
    print('\n\n### registro nao salvo, ja existe um log de hoje salvo.');
  }
}

void listData() {
  dynamic fileData = readFile();
  fileData = (fileData != null && fileData.length > 0 ? json.decode(fileData) : List());

  print('\n### Listagem dos dados ###');

  fileData.forEach((data) {
    print('${data['date']} -> ${data['data']}');
  });
}

String readFile() {
  Directory dir = Directory.current;
  File file = File(dir.path + '/meu_arquivo.txt');
  if(!file.existsSync()) {
    print('Arquivo não encontrado');
    return null;
  }
  return file.readAsStringSync();
}

today() async {
  var data = await getData();
  print('\n\n ### HG - Brasil ###');
  print('${data['date']} \n${data['data']}');
}

Future getData() async {
  String url = 'https://api.hgbrasil.com/finance?key=296f2c8c';
  http.Response response = await http.get(url);

  if(response.statusCode == 200) {
    var data = json.decode(response.body)['results']['currencies'];
    var usd = data['USD'];
    var eur = data['EUR'];
    var gbp = data['GBP'];
    var ars = data['ARS'];
    var btc = data['BTC'];

    Map formatedMap = Map();
    formatedMap['date'] = now(); //nowDate
    formatedMap['data'] = '${usd['name']} ${usd['buy']} - ${eur['name']} ${eur['buy']} - ${gbp['name']} ${gbp['buy']} - ${ars['name']} ${ars['buy']} - ${btc['name']} ${btc['buy']} - ';

    return formatedMap;
  } else {
    throw('Falhou.');
  }
}

String now() {
  var now = DateTime.now();
  return '${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString()}';
}
