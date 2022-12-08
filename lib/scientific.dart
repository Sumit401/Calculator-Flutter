import 'dart:math';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scientific Calculator"), // Title of the activity
      ),
      drawer: Navigation_drawer(), //For navigation Drawer

      //Below Layout Design for the activity
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
                  todisplayoutput,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            // Below Four Output section
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.bottomRight,
                child: Text(
                  todisplayoutput,
                  style: TextStyle(fontSize: 50, color: Colors.black),
                ),
              ),
            ),
            // Below section for buttons
            Row(children: [
              custom_sc_btn("root"),
              custom_sc_btn("pow"),
              custom_sc_btn("CS"),
              custom_sc_btn("BS"),
              custom_sc_btn("=")
            ]),
            Row(children: [
              custom_sc_btn("sin"),
              custom_sc_btn("cos"),
              custom_sc_btn("tan"),
              custom_sc_btn("pie"),
              custom_sc_btn("exp")
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
              custom_sc_btn("*")
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

  //////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////
  // Designing for all Buttons.............................................
  //////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////

  Widget custom_sc_btn(String val) {
    if (val == "root") {
      return (Expanded(
        child: (OutlinedButton(
          onPressed: () => {tasktocarryout(val)},
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
          onPressed: () => {tasktocarryout(val)},
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
          onPressed: () => {tasktocarryout(val)},
          child: Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 30),
              child: Icon(
                FontAwesomeIcons.circleXmark,
                size: 20,
                color: Colors.black,
              )),
        )),
      ));
    } else if (val == "pow") {
      return (Expanded(
        child: (OutlinedButton(
          onPressed: () => {tasktocarryout(val)},
          child: Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 30),
              child: Text(
                "x\u02b8",
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
        )),
      ));
    } else if (val == "log") {
      return (Expanded(
        child: (OutlinedButton(
          onPressed: () => {tasktocarryout(val)},
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 30),
            child: Text("log\u2091",
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
        )),
      ));
    } else if (val == "=") {
      return (Expanded(
        child: (OutlinedButton(
          onPressed: () => {tasktocarryout(val)},
          child: Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 30),
              child: Icon(
                FontAwesomeIcons.equals,
                size: 20,
                color: Colors.black,
              )),
        )),
      ));
    } else if (val == "pie") {
      return (Expanded(
        child: (OutlinedButton(
          onPressed: () => {tasktocarryout(val)},
          child: Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 30),
              child: /*Icon(
                FontAwesomeIcons.pie,
                size: 20,
                color: Colors.black,
              )*/
                  Text(val,
                      style: TextStyle(fontSize: 20, color: Colors.black))),
        )),
      ));
    } else {
      return (Expanded(
        child: (OutlinedButton(
          onPressed: () => {tasktocarryout(val)},
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 30),
            child:
                Text(val, style: TextStyle(fontSize: 20, color: Colors.black)),
          ),
        )),
      ));
    }
  }

  //////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////
  // Mathematical Calculation for all Buttons.............................................
  //////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////

  String operations_display = "";
  String res2 = "";
  String todisplayoutput = "";
  double first_num = 0;
  double second_num = 0;
  String operators = "";
  String res = "";

  void tasktocarryout(String val) {
    if (val == "CS") {
      res = "";
      operations_display = "";
      first_num = 0;
      second_num = 0;
      operators = "";
      res2 = "";
      todisplayoutput = "";
    } else if ((val == "+" ||
            val == "-" ||
            val == "*" ||
            val == "/" ||
            val == "%") &&
        (todisplayoutput != "")) {
      first_num = double.parse(todisplayoutput);
      operators = val;
      res = "";
    } else if (val == "BS") {
      if (todisplayoutput != "+" ||
          todisplayoutput != "-" ||
          todisplayoutput != "X" ||
          todisplayoutput != "/" ||
          todisplayoutput != "%") {
        res = todisplayoutput.substring(0, todisplayoutput.length - 1);
      }
    }
    else if(val=="x!"){
      first_num = double.parse(todisplayoutput);
      int temp=1;
      for(int k=first_num.toInt();k>0;k--){
        temp=temp*k;
      }
      res=temp.toString();
    }
    else if (val == "root") {
      first_num = double.parse(todisplayoutput);
      res = sqrt(first_num).toString();
    } else if (val == "pow") {
      first_num = double.parse(todisplayoutput);
      operators = val;
      res = "";
    } else if (val == "sin") {
      first_num = double.parse(todisplayoutput);
      res = sin(first_num).toString();
    } else if (val == "cos") {
      first_num = double.parse(todisplayoutput);
      res = cos(first_num).toString();
    } else if (val == "tan") {
      first_num = double.parse(todisplayoutput);
      res = tan(first_num).toString();
    } else if (val == "tan") {
      first_num = double.parse(todisplayoutput);
      res = tan(first_num).toString();
    } else if (val == "log") {
      first_num = double.parse(todisplayoutput);
      res = log(first_num).toString();
    } else if (val == "1/x") {
      first_num = double.parse(todisplayoutput);
      if (first_num > 0) {
        res = (1 / first_num).toString();
      }
    } else if (val == "e") {
      res = e.toString();
    } else if (val == "pie") {
      res = pi.toString();
    } else if (val == "exp") {
      first_num = double.parse(todisplayoutput);
      res = exp(first_num).toString();
    } else if (val == "=") {
      second_num = double.parse(todisplayoutput);
      res2 = operations_display + todisplayoutput;
      if (operators == "+") {
        res = (first_num + second_num).toString();
      } else if (operators == "-") {
        res = (first_num - second_num).toString();
      } else if (operators == "X") {
        res = (first_num * second_num).toString();
      } else if (operators == "/") {
        res = (first_num / second_num).toString();
      } else if (operators == "%") {
        res = ((first_num * second_num) / 100).toString();
      } else if (operators == "pow") {
        res = pow(first_num, second_num).toString();
      }
    } else if (val == "1" ||
        val == "2" ||
        val == "3" ||
        val == "4" ||
        val == "5" ||
        val == "6" ||
        val == "7" ||
        val == "8" ||
        val == "9" ||
        val == "0" ||
        val == "." ||
        val == "-") {
      if (todisplayoutput == "0") {
        res = val;
      } else {
        res = todisplayoutput + val;
      }
    }
    // calling set state function
    setState(() {
      todisplayoutput = res; // for output
    });
  }
}
