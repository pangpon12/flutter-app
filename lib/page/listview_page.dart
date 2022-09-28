import 'package:flutter/material.dart';
import 'package:seven_color_health/database.dart';
import 'package:seven_color_health/note.dart';
import 'edit_page.dart';
import 'detail_page.dart';
import 'package:seven_color_health/widget/card_widget.dart';

class listviewpage extends StatefulWidget {
  const listviewpage({Key? key}) : super(key: key);

  @override
  _listviewpageState createState() => _listviewpageState();
}

class _listviewpageState extends State<listviewpage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    USERDATABASE.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await USERDATABASE.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : notes.isEmpty
                  ? Text(
                      'No Notes',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  : buildNotes(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditNotePage()),
            );

            refreshNotes();
          },
        ),
      );

  Widget buildNotes() => ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) {
        final note = notes[index];
        return ListTile(
          title: Text(note.title),
          subtitle: Text(note.description + '  ' + note.bloodtype),
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NoteDetailPage(noteId: note.id!),
            ));

            refreshNotes();
          },
        );
      });
}
