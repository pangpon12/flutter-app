import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:seven_color_health/database.dart';
import 'package:seven_color_health/note.dart';
import 'edit_page.dart';
import 'detail_page.dart';
import 'package:seven_color_health/widget/card_widget.dart';
import 'listview_page.dart';
import 'nav_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;

  int currentIndex = 0;

  final screendisplay = [
    Image.asset('image/bg.png'),
    listviewpage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            '7 Color health',
            style: TextStyle(fontSize: 24),
          ),
          actions: [Icon(Icons.search), SizedBox(width: 12)],
        ),
        body: Center(
          child: screendisplay.elementAt(currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'page 1'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dangerous), label: 'page 2'),
            ]),
      );
}
