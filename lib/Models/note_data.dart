import 'package:flutter/material.dart';
import 'package:notes_app/Models/note.dart';

class NoteData extends ChangeNotifier {
  //*Overall List of notes
  List<Note> allNotes = [
    //*Default First Note
    Note(id: 0, text: 'First Note')
  ];

  //*Get notes
  List<Note> getAllNotes() {
    return allNotes;
  }

  //*Add a new note
  void addNewNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  //*Update note
  void updateNote(Note note, String text) {
    //*Go through all note
    for (int i = 0; i < allNotes.length; i++) {
      //*Find the relevent note
      if (allNotes[i].id == note.id) {
        //*Replace Text
        allNotes[i].text = text;
      }
    }
    notifyListeners();
  }

  //*Delete note
  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }
}
