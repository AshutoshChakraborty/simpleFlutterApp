import 'package:flutter/material.dart';
import 'package:hello_world/screens/note_detail.dart';
import 'package:hello_world/screens/note_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Note taking App',
      home: NoteList(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
