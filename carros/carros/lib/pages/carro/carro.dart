import 'dart:convert' as convert;

import 'package:carros/utils/event_bus.dart';
import 'package:carros/utils/sql/entity.dart';

class CarroEvent extends Event {
  // salvar deletar update
  String acao;

  // classicos esportivos e luxo
  String tipo;

  CarroEvent(this.acao, this.tipo);

  @override
  String toString() {
    // TODO: implement toString
    return 'CarroEvent{acao: $acao, tipo: $tipo}';
  }
}

class Carro extends Entity {
  int id;
  String nome;
  String tipo;
  String descricao;
  String urlFoto;
  String urlVideo;
  String latitude;
  String longitude;

  Carro(
      {this.id,
        this.nome,
        this.tipo,
        this.descricao,
        this.urlFoto,
        this.urlVideo,
        this.latitude,
        this.longitude});

  Carro.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    tipo = map['tipo'];
    descricao = map['descricao'];
    urlFoto = map['urlFoto'];
    urlVideo = map['urlVideo'];
    latitude = map['latitude'];
    longitude = map['longitude'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['tipo'] = this.tipo;
    data['descricao'] = this.descricao;
    data['urlFoto'] = this.urlFoto;
    data['urlVideo'] = this.urlVideo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }

  String toJson() {
    String json = convert.json.encode(toMap());
    return json;
  }
}