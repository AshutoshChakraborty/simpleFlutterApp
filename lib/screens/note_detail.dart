import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  String title;
  NoteDetails(this.title);

  _NoteDetailsState createState() => _NoteDetailsState(this.title);
}

class _NoteDetailsState extends State<NoteDetails> {
  static var _priorities = ["High", "Low"];

  var _titleController = TextEditingController();
  var _descriptionController = TextEditingController();

  var title;
  _NoteDetailsState(this.title);
  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.title;
    return Container(
      child: WillPopScope(
        onWillPop: (){
          moveToLastScreen();
        },
              child: Scaffold(
            appBar: AppBar(
              title: Text(this.title),
               leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  moveToLastScreen();
                }),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(children: <Widget>[
                ListTile(
                  title: DropdownButton(
                      items: _priorities.map((String s) {
                        return DropdownMenuItem(
                          value: s,
                          child: Text(s),
                        );
                      }).toList(),
                      onChanged: (s) {
                        setState(() {});
                      },
                      value: "Low"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextField(
                    style: style,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3.0))),
                        hintText: "Enter the title",
                        labelText: "Title"),
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    controller: _titleController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextField(
                      style: style,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0))),
                          hintText: "Enter the description",
                          labelText: "Description"),
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      controller: _descriptionController),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: RaisedButton(
                        onPressed: () {},
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text("Save", textScaleFactor: 1.5),
                      )),
                      Container(
                        width: 8.0
                      ),
                      Expanded(
                          child: RaisedButton(
                        onPressed: () {},
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text("Delete", textScaleFactor: 1.5),
                      ))
                    ],
                  ),
                )
              ]),
            )),
      ),
    );
  }
   void moveToLastScreen() {
    Navigator.pop(context);
  }
}
