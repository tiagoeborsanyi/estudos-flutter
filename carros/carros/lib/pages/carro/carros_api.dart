import 'dart:io';

import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/upload_api.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {

    Usuario user = await Usuario.get();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    var url = 'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo';

//      print("GET >> $url");

    var response = await http.get(url, headers: headers);

    String json = response.body;

//    print(json);

    List list = convert.json.decode(json);

    final carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

    return carros;
  }

  static Future<ApiResponse<bool>> save(Carro c, File file) async {
    try {

      if (file != null) {
        ApiResponse<String> response = await UploadApi.upload(file);
        if (response.ok) {
          String urlFoto = response.result;
          c.urlFoto = urlFoto;
        }
      }

      Usuario user = await Usuario.get();
      
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${user.token}"
      };
      
      var url = 'https://carros-springboot.herokuapp.com/api/v2/carros';

      if (c.id != null) {
        url += "/${c.id}";
      }
      
      print("POST > $url");
      
      String json = c.toJson();
      
      var response = await (
        c.id == null
          ? http.post(url, body: json, headers: headers)
          : http.put(url, body: json, headers: headers)
      );
      
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      
      if (response.statusCode == 201 || response.statusCode == 200) {
        Map mapReduce = convert.json.decode(response.body);
      
        Carro carro = Carro.fromMap(mapReduce);
      
        print("Novo carro: ${carro.id}");
      
        return ApiResponse.ok(true);
      }
      
      if (response.body == null || response.body.isEmpty) {
        return ApiResponse.error("Não foi possível salvar o carro");
      }
      Map mapResponse = convert.json.decode(response.body);
      return ApiResponse.error(mapResponse["error"]);
    } on Exception catch (e) {
      print(e);
      return ApiResponse.error("Não foi possível salvar o carro");
    }
  }

  static delete (Carro c) async {
    try {
      Usuario user = await Usuario.get();

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${user.token}"
      };

      var url = 'https://carros-springboot.herokuapp.com/api/v2/carros/${c.id}';

      print("DELETE > $url");

      var response = await http.delete(url, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return ApiResponse.ok(true);
      }
      return ApiResponse.error("Não foi possivel deletar o carro.");
    } on Exception catch (e) {
      print(e);
      return ApiResponse.error("Não foi possivel deletar o carro.");
    }
  }
}
