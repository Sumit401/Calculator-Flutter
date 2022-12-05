import 'package:flutter/material.dart';
import '/main_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Basic Calculator',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Main_screen()
    );
  }
}
