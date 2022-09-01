import 'package:flutter/material.dart';
import 'package:freshstart/db_service.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freshstart/model/list_model.dart';

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
    // @override
    // Widget build(BuildContext context) {
    //   return StaggeredGrid.count(
    //     crossAxisCount: 4,
    //     mainAxisSpacing: 4,
    //     crossAxisSpacing: 4,
    //     children: [

    //     ],
    //   );
    // }

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

      body: Column(
        children: [
          //DATA GET GARNE BUTTON
          MaterialButton(
            padding: EdgeInsets.all(18.0),
            onPressed: () {},
            child: Text("Add notes "),
          ),
          //DATA FETCH GARNE BUTTON
          MaterialButton(
            padding: EdgeInsets.all(18.0),
            onPressed: () {
              getNotes();
            },
            child: Text("Fetch notes"),
          ),
          //container where we write our notes

          Flexible(
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => Listcard()),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final item = notes[index];
                  return InkWell(
                    child: Column(
                      children: [
                        Text(item['text']),
                        Text(item['body']),
                        Text(item['datecreated']),
                      ],
                    ),
                  );
                }),
          ),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}

class Listcard extends StatelessWidget {
  const Listcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: products[0].color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(children: <Widget>[
        Expanded(
            child: PageView(
          children: [
            Text(
              products[0].title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(products[0].body),
            Text(
              products[1].title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(products[1].body),
            SizedBox(
              height: 20,
            ),
            Text(
              products[2].title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(products[2].body),
          ],
        )),
      ]),
    );
  }
}
