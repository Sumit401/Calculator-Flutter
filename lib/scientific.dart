import 'package:flutter/material.dart';
import 'package:project/Navigation_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Scientific extends StatefulWidget {
  static const route = "/scientific";

  const Scientific({Key? key}) : super(key: key);

  @override
  State<Scientific> createState() => _ScientificState();
}

class _ScientificState extends State<Scientific> {
  Widget custom_sc_btn(String val) {
    if (val == "RT") {
      return (Expanded(
        child: (OutlinedButton(
          onPressed: () => {},
          child: Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 30),
              child: Icon(
                FontAwesomeIcons.squareRootVariable,
                size: 20,
                color: Colors.black,
              )),
        )),
      ));
    } else if (val == "BS") {
      return (Expanded(
        child: (OutlinedButton(
          onPressed: () => {},
          child: Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 30),
              child: Icon(
                FontAwesomeIcons.deleteLeft,
                size: 20,
                color: Colors.black,
              )),
        )),
      ));
    } else if (val == "CS") {
      return (Expanded(
        child: (OutlinedButton(
          onPressed: () => {},
          child: Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 30),
              child: Icon(
                FontAwesomeIcons.circleXmark,
                size: 20,
                color: Colors.black,
              )),
        )),
      ));
    } else if (val == "^") {
      return (Expanded(
        child: (OutlinedButton(
          onPressed: () => {},
          child: Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 30),
              child: Text(
                "x\u02b8",
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
        )),
      ));
    } else if (val == "=") {
      return (Expanded(
        child: (OutlinedButton(
          onPressed: () => {},
          child: Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 30),
              child: Icon(
                FontAwesomeIcons.equals,
                size: 20,
                color: Colors.black,
              )),
        )),
      ));
    } else {
      return (Expanded(
        child: (OutlinedButton(
          onPressed: () => {},
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 30),
            child:
                Text(val, style: TextStyle(fontSize: 20, color: Colors.black)),
          ),
        )),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scientific Calculator"),
      ),
      drawer: Navigation_drawer(),
      body: Container(
        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Below for sub output section
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Output",
                  style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.w300),),
              ),
            ),
            // Below Four Output section
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.bottomRight,
                child: Text(
                  "Output",
                style: TextStyle(fontSize: 50,color: Colors.black),),
              ),
            ),
            // Below section for buttons
            Row(children: [
              custom_sc_btn("RT"),
              custom_sc_btn("^"),
              custom_sc_btn("CS"),
              custom_sc_btn("BS"),
              custom_sc_btn("=")
            ]),
            Row(children: [
              custom_sc_btn("sin"),
              custom_sc_btn("cos"),
              custom_sc_btn("tan"),
              custom_sc_btn("("),
              custom_sc_btn(")")
            ]),
            Row(children: [
              custom_sc_btn("log"),
              custom_sc_btn("9"),
              custom_sc_btn("8"),
              custom_sc_btn("7"),
              custom_sc_btn("+")
            ]),
            Row(children: [
              custom_sc_btn("1/x"),
              custom_sc_btn("6"),
              custom_sc_btn("5"),
              custom_sc_btn("4"),
              custom_sc_btn("-")
            ]),
            Row(children: [
              custom_sc_btn("x!"),
              custom_sc_btn("3"),
              custom_sc_btn("2"),
              custom_sc_btn("1"),
              custom_sc_btn("X")
            ]),
            Row(children: [
              custom_sc_btn("e"),
              custom_sc_btn("."),
              custom_sc_btn("0"),
              custom_sc_btn("%"),
              custom_sc_btn("/")
            ])
          ],
        ),
      ),
    );
  }
}
