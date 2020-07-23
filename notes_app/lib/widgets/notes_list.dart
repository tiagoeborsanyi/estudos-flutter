import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(itemBuilder: (ctx, index) {
        return Text('data');
      }),
    );
  }
}
