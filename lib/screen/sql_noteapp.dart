import 'package:flutter/material.dart';
import 'package:freshstart/db_service.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqlNoteScreen extends StatefulWidget {
  const SqlNoteScreen({Key? key}) : super(key: key);

  @override
  State<SqlNoteScreen> createState() => _SqlNoteScreenState();
}

class _SqlNoteScreenState extends State<SqlNoteScreen> {
  static int _version = 1;

  static late Database db;

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  List notes = [];
  @override
  void initState() {
    super.initState();
    initAndGetNotes();
  }

  getNotes() async {
    final result = await DbService.getNotes();
    notes = result;
    setState(() {});
  }

  initAndGetNotes() {
    DbService.initDatabase().then((value) {
      getNotes();
    });
  }

  addNote() async {
    DbService.addNote(body: bodyController.text, title: titleController.text);
    getNotes();
  }

  // deleteNote() async {}
  // updateNote() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text("Notes"),
          actions: [
            MaterialButton(
              onPressed: () {},
              child: Icon(Icons.search),
            )
          ]),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //DATA GET GARNE BUTTON
        MaterialButton(
          onPressed: () {},
          child: Text("Add notes "),
        ),
        //DATA FETCH GARNE BUTTON
        MaterialButton(
          onPressed: () {
            getNotes();
          },
          child: Text("Fetch notes"),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final item = notes[index];
                return InkWell(
                  child: Column(
                    children: [
                      Text(item['text']),
                      Text(item['body']),
                      Text(item['datecreated']),
                      Container(
                        decoration: BoxDecoration(color: Colors.pink[100]),
                      )
                    ],
                  ),
                );
              }),
        )
      ]),
    );
  }
}
