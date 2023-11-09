import 'package:flutter/material.dart';
import 'package:notes_app/Models/note.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:notes_app/Models/note_data.dart';
import 'package:provider/provider.dart';

class EditingNotePage extends StatefulWidget {
  Note note;
  bool isNewNote;

  EditingNotePage({
    super.key,
    required this.note,
    required this.isNewNote,
  });

  @override
  State<EditingNotePage> createState() => _EditingNotePageState();
}

class _EditingNotePageState extends State<EditingNotePage> {
  QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    loadExistingNote();
  }

  //* Load Existing Note
  void loadExistingNote() {
    final doc = Document()..insert(0, widget.note.text);
    setState(() {
      _controller = QuillController(
        document: doc,
        selection: const TextSelection.collapsed(offset: 0),
      );
    });
  }

  //* Add new note
  void addNewNote(int id) {
    //* Get text from editor
    String text = _controller.document.toPlainText();

    //*Add the new note
    Provider
      .of<NoteData>(context, listen: false)
      .addNewNote(
        Note(
          id: id,
          text: text,
        ),
      );
  }

  //* update note
  void updateNote(Note note) {
    //*get test from editor
    String text = _controller.document.toPlainText();
    //* Update the note
    Provider
      .of<NoteData>(context, listen: false)
      .updateNote(
        note, text
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
