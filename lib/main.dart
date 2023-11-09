
import 'package:flutter/material.dart';
import 'package:notes_app/Models/note_data.dart';
import 'package:notes_app/Screens/home_screen.dart';
import 'package:notes_app/Themes/dark_theme.dart';
import 'package:notes_app/Themes/light_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //* This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteData(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: lightTheme,
        darkTheme: darkTheme,
      ),
    );
  }
}
