import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/Navigation_drawer.dart';
import 'Responsive.dart';
class Main_screen extends StatefulWidget {
  static const route = "/basic";

  const Main_screen({Key? key}) : super(key: key);

  @override
  State<Main_screen> createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {
  @override
  Widget build(BuildContext context) {
    var screen_size=MediaQuery.of(context).size;
    return Scaffold(
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(title: Text("Basic Calculator"))
            : PreferredSize(
                child: Container(), preferredSize: Size(screen_size.width, 70)),
        drawer: Navigation_drawer(),
        body: Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            child: Text(operations_display,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300)),
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          ),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            child: Text(
                              todisplayoutput,
                              style: TextStyle(fontSize: 50),
                            ),
                            alignment: Alignment.bottomRight,
                          ),
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      custom_btn("CS"),
                                      custom_btn("BS"),
                                      custom_btn("="),
                                    ]),
                                Row(children: [
                                  custom_btn("9"),
                                  custom_btn("8"),
                                  custom_btn("7"),
                                  custom_btn("+")
                                ]),
                                Row(children: [
                                  custom_btn("6"),
                                  custom_btn("5"),
                                  custom_btn("4"),
                                  custom_btn("-")
                                ]),
                                Row(children: [
                                  custom_btn("3"),
                                  custom_btn("2"),
                                  custom_btn("1"),
                                  custom_btn("*")
                                ]),
                                Row(children: [
                                  custom_btn("."),
                                  custom_btn("0"),
                                  custom_btn("%"),
                                  custom_btn("/")
                                ])
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }

  //////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////
  // Designing for all Buttons.............................................
  // Function for Buttons..................................................
  //////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////

  Widget custom_btn(String value) {
    if (value == "BS") {
      return ((Expanded(
          child: (OutlinedButton(
        onPressed: () => tasktocarry(value),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Icon(
              FontAwesomeIcons.deleteLeft,
              color: Colors.black,
            )),
      )))));
    } else if (value == "CS") {
      return ((Expanded(
          child: (OutlinedButton(
        onPressed: () => tasktocarry(value),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Icon(
              FontAwesomeIcons.circleXmark,
              color: Colors.black,
            )),
      )))));
    } else if (value == "=") {
      return ((Expanded(
          child: (OutlinedButton(
        onPressed: () => tasktocarry(value),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Icon(
              FontAwesomeIcons.equals,
              color: Colors.black,
            )),
      )))));
    }
    else {
      return ((Expanded(
          child: (OutlinedButton(
        onPressed: () => tasktocarry(value),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            value,
            style: TextStyle(fontSize: 25, color: Colors.black87,fontWeight: FontWeight.bold),
          ),
        ),
      )))));
    }
  }

  //////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////
  // Mathematical Calculation for all Buttons.............................................
  // Function to Carry operations.........................................................
  //////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////

  String operations_display = ""; // for operations field
  String res2 = ""; // for to operations output field resource value
  String todisplayoutput = "0"; // for output field
  double first_num = 0; // first number
  double second_num = 0; // for second number
  String operat = ""; // for operations
  String res = ""; // for to display output field resource value

  void tasktocarry(String val) {
    //print(val);
    if (val == "CS") {
      operations_display = "";
      first_num = 0;
      second_num = 0;
      res = "0";
      res2 = "0";
      operat = "";
    } else if (val == "+" ||
        val == "-" ||
        val == "*" ||
        val == "/" ||
        val == "%") {
      res = "";
      operat = val;

      if (todisplayoutput == "+" ||
          todisplayoutput == "-" ||
          todisplayoutput == "*" ||
          todisplayoutput == "/" ||
          todisplayoutput == "%") {
        res = val;
        res2 = operations_display.substring(0, operations_display.length - 1) +
            val;
      } else {
        first_num = double.parse(todisplayoutput);
        res = val;
        res2 = todisplayoutput + val;
      }
    } else if (val == "BS") {
      if (todisplayoutput != "+" ||
          todisplayoutput != "-" ||
          todisplayoutput != "*" ||
          todisplayoutput != "/" ||
          todisplayoutput != "%") {
        res = todisplayoutput.substring(0, todisplayoutput.length - 1);
        /*double d=0;
            int temp=int.parse(todisplayoutput);
            d=temp/10;
            temp=d as int;
            res=d.toString();*/
      }
    } else if (val == "=") {
      second_num = double.parse(todisplayoutput);
      res2 = operations_display + todisplayoutput;
      if (operat == "+") {
        res = (first_num + second_num).toString();
      } else if (operat == "-") {
        res = (first_num - second_num).toString();
      } else if (operat == "*") {
        res = (first_num * second_num).toString();
      } else if (operat == "/") {
        res = (first_num / second_num).toString();
      } else if (operat == "%") {
        res = ((first_num * second_num) / 100).toString();
      }
    } else {
      if (todisplayoutput == "+" ||
          todisplayoutput == "-" ||
          todisplayoutput == "*" ||
          todisplayoutput == "/" ||
          todisplayoutput == "%") {
        res = "";
        res = val;
      } else {
        if (todisplayoutput == "0") {
          res = val;
        } else {
          res = todisplayoutput + val;
        }
      }
    }
    //set state function......................
    setState(() {
      operations_display = res2; // for operations
      todisplayoutput = res; // for output
    });
  }
}
