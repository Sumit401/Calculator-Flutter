import 'package:flutter/material.dart';
import 'package:project/Navigation_drawer.dart';

class Converters_File extends StatefulWidget {
  static const route = "/converters_file";
  const Converters_File({Key? key}) : super(key: key);

  @override
  State<Converters_File> createState() => _Converters_FileState();
}

class _Converters_FileState extends State<Converters_File> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conveter")),
      drawer: Navigation_drawer(),
      body: Container(),
    );
  }
}
