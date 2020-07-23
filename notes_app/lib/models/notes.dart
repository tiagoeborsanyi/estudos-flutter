import 'package:flutter/foundation.dart';

class Notes {
  final String id;
  final String title;
  final String content;
  final DateTime date;

  Notes({
    @required this.id,
    @required this.title,
    @required this.content,
    @required this.date,
  });
}
