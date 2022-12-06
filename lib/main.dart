import 'package:flutter/material.dart';
import 'package:project/converters_file.dart';
import 'package:project/scientific.dart';
import '/basic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scientific Calculator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          Main_screen.route: (_) => Main_screen(),
          Scientific.route: (_) => Scientific(),
          Converters_File.route: (_) => Converters_File(),
        },
        home: Main_screen());
  }
}
