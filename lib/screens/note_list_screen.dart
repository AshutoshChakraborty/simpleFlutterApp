import 'package:flutter/material.dart';
import 'package:hello_world/screens/note_detail.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  var itemCount = 2;
  @override
  Widget build(BuildContext context) => scafoldWidget();

  Widget scafoldWidget() {
    return Scaffold(
      appBar: AppBar(title: Text("Note List")),
      body: getListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetails("Add Note");
        },
        tooltip: "Add Note",
        child: Icon(Icons.add),
      ),
    );
  }

  navigateToDetails(String s) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => NoteDetails(s)));

  ListView getListItems() {
    TextStyle style = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int count) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(
                "Dummy title",
                style: style,
              ),
              subtitle: Text("Dummy subtitle"),
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              trailing: Icon(Icons.delete),
              onTap: () {
                navigateToDetails("Edit Note");
              },
            ),
          );
        });
  }
}
