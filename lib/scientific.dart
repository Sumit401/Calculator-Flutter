import 'package:flutter/material.dart';
import 'package:project/Navigation_drawer.dart';

class Scientific extends StatefulWidget {
  static const route = "/scientific";

  const Scientific({Key? key}) : super(key: key);

  @override
  State<Scientific> createState() => _ScientificState();
}
class _ScientificState extends State<Scientific> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scientific Calculator"),
      ),
      drawer: Navigation_drawer(),
    );
  }
}
