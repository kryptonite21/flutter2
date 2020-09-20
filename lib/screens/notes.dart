import 'package:flutter/material.dart';
import 'note.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List items = [
    {'id': 1, 'title': 'Item 1', 'date': '2020-01-01'},
    {'id': 2, 'title': 'Item 2', 'date': '2020-02-01'},
    {'id': 3, 'title': 'Item 3', 'date': '2020-03-01'},
    {'id': 4, 'title': 'Item 4', 'date': '2020-04-01'},
    {'id': 5, 'title': 'Item 5', 'date': '2020-05-01'},
    {'id': 6, 'title': 'Item 6', 'date': '2020-06-01'},
    {'id': 7, 'title': 'Item 7', 'date': '2020-07-01'},
    {'id': 8, 'title': 'Item 8', 'date': '2020-08-01'},
    {'id': 9, 'title': 'Item 9', 'date': '2020-09-01'},
    {'id': 10, 'title': 'Item 10', 'date': '2020-10-01'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: _getNotesListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Note();
          }));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  ListView _getNotesListView() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key('${items[index]['id']}'),
          onDismissed: (direction) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${items[index]['title']} deleted'),
              ),
            );

            setState(() {
              items.removeWhere((item) => item['id'] == items[index]['id']);
            });
          },
          background: slideRightBackground(),
          secondaryBackground: slideLeftBackground(),
          child: ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.event_note),
            ),
            title: Text('${items[index]['title']}'),
            subtitle: Text('${items[index]['date']}'),
          ),
        );
      },
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              "Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              "Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
