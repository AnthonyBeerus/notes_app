import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Models/note.dart';
import 'package:notes_app/Models/note_data.dart';
import 'package:notes_app/Screens/editing_note_pahe.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  //* Create New Note

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void createNewNote() {
    //* Create new id
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
    //* create blank note
    Note newNote = Note(
      id: id,
      text: '',
    );

    //* Got edit the page
    goToNewPage(newNote, true);
  }

  //* Go to new page
  void goToNewPage(Note note, bool isNewNote) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditingNotePage(
          isNewNote: false,
          note: note,
        ),
      ),
    );
  }

  //* Delete notes
  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.background,
        //   title: const Text('NOTES'),
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: createNewNote,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Heading
            const Padding(
              padding: EdgeInsets.only(top: 75.0, left: 25.0),
              child: Text(
                'Notes',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //* List of Notes
            CupertinoListSection.insetGrouped(
              children: List.generate(
                value.getAllNotes().length,
                (index) => CupertinoListTile(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  title: Text(
                    value.getAllNotes()[index].text,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
