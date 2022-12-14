import 'package:flutter/material.dart';
import 'package:project/Navigation_drawer.dart';
import 'package:project/Responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              preferredSize: Size(screen_size.width, 70),
              child: TopBarContent()),
      drawer: Navigation_drawer(),
      body: Container(
        child: SingleChildScrollView(
          child: SizedBox(
              height: screen_size.height,
              child: Expanded(
                child: Column(
            children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  child: Text("Get In Touch",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  child: Text("Any Question or Remarks ? Just write us a Message.",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(child: Icon(FontAwesomeIcons.phoneVolume),),
                      Container(child: Icon(FontAwesomeIcons.envelope),),
                      Container(child: Icon(FontAwesomeIcons.locationDot),)
                    ],
                  ),
                )
            ],
          ),
              )),
        ),
      ),
    );
  }
}
