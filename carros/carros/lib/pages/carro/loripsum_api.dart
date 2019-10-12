import 'dart:async';

import 'package:http/http.dart' as http;

class LoripsumBloc {

  static String lorim;

  final _streamController = StreamController<String>();

  Stream<String> get stream => _streamController.stream;
//  get close => _streamController.close();

  fetch() async {

    try {

     String s = lorim ?? await LoripsumApi.getLoripsum();

     lorim = s;

     _streamController.add(s);

    } catch (e) {
      _streamController.addError(e);
    }

  }

  dispose() {
    // ignore: unnecessary_statements
    _streamController.close;
  }

}


class LoripsumApi {

  static Future<String> getLoripsum() async {

    var url = 'https://loripsum.net/api';

    var response = await http.get(url);

    String text = response.body;

    text = text.replaceAll("<p>", "");
    text = text.replaceAll("<\/p>", "");

    return text;
  }
}