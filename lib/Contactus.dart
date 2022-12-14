import 'package:flutter/material.dart';
import 'package:project/Navigation_drawer.dart';
import 'package:project/Responsive.dart';
import 'package:project/TopBarContent.dart';

class Contactus extends StatefulWidget {
  static const route = "/Contactus";

  const Contactus({Key? key}) : super(key: key);

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    var screen_size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar()
          : PreferredSize(
          child: TopBarContent(), preferredSize: Size(screen_size.width, 70)),
      drawer: Navigation_drawer(),
      body: Container(child: Text("Hello World")),
    );
  }
}
