import 'package:flutter/material.dart';
import 'package:project/Navigation_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Converters_File extends StatefulWidget {
  static const route = "/converters_file";

  const Converters_File({Key? key}) : super(key: key);

  @override
  State<Converters_File> createState() => _Converters_FileState();
}

class _Converters_FileState extends State<Converters_File> {
  var items = ["Length", "Mass", "Speed", "Temperature"];
  var length = [
    "Centimeter",
    "Kilometre",
    "Millimetre",
    "Meter",
    "Mile",
    "Foot",
    "Inch"
  ];
  var mass = ["Kilogram", "Gram", "Imperial ton", "Pound", "Ounce"];
  var speed = [
    "Mile per hour",
    "Meter per second",
    "Kilometer per hour",
    "Knot"
  ];
  var temperature = ["Degree Celsius", "Fahrenheit", "Kelvin"];

  //var i=1;
  //var subitems=[{"Centimeter","Kilometre","Millimetre","Meter","Mile","Foot","Inch"},{"Kilogram","Gram","Imperial ton","Pound","Ounce"},
  //{"Mile per hour","Meter per second","Kilometer per hour","Knot"},{"Degree Celsius","Fahrenheit","Kelvin"}];
  //var to=[];

  String? _dropdownvalue = "Length";
  String? length1 = "Centimeter";
  String? length2 = "Centimeter";
  String? mass1 = "Kilogram";
  String? mass2 = "Kilogram";
  String? speed1 = "Mile per hour";
  String? speed2 = "Mile per hour";
  String? temp1 = "Degree Celsius";
  String? temp2 = "Degree Celsius";
  String? k1 = "Centimeter";
  String? k2 = "Centimeter";
  String? text_input_field ="";
  late TextEditingController _c ;

  @override
  void initState() {
    _c = new TextEditingController(text: text_input_field);
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _c?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Conveter")),
        drawer: Navigation_drawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Center(
                  child: Container(
                    width: 400,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape
                          .rectangle, /*border: Border.all(color: Colors.black)*/
                    ),
                    child: DropdownButton<String>(
                      items: items
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      isExpanded: true,
                      icon: Icon(FontAwesomeIcons.anglesDown,
                          color: Colors.black),
                      iconSize: 25,
                      value: _dropdownvalue,
                      onChanged: (val) {
                        setState(() {
                          _dropdownvalue = val;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 40, left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder()),
                        onChanged: (value) {
                        text_input_field=value;
                        print(value);
                        },
                        controller: _c,
                  )),
                  VerticalDivider(
                    width: 40,
                  ),
                  Expanded(
                      child: Text(text_input_field!))
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 40, left: 40),
              child: Row(
                children: [
                  Expanded(child: func(_dropdownvalue)),
                  VerticalDivider(
                    width: 40,
                  ),
                  Expanded(child: func2(_dropdownvalue)),
                ],
              ),
            ),
            ElevatedButton(onPressed: () {
              setState(() {
                var c=(_c.text).toString();

              });
            }, child: Text("Check"),
            )
          ],
        ));
  }

  Widget func(String? dropdownvalue) {
    if (dropdownvalue == "Length") {
      k1 = "Centimeter";
      k2 = "Centimeter";
      return (DropdownButton<String>(
        items: length
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        isExpanded: true,
        icon: Icon(FontAwesomeIcons.anglesDown, color: Colors.black),
        iconSize: 25,
        onChanged: (val) {
          setState(() {
            length1 = val;
            k1 = val;
          });
        },
        value: length1,
      ));
    } else if (_dropdownvalue == "Mass") {
      k1 = "Kilogram";
      k2 = "Kilogram";
      return (DropdownButton<String>(
        items: mass
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        isExpanded: true,
        icon: Icon(FontAwesomeIcons.anglesDown, color: Colors.black),
        iconSize: 25,
        onChanged: (val) {
          setState(() {
            mass1 = val;
            k1 = val;
          });
        },
        value: mass1,
      ));
    } else if (_dropdownvalue == "Speed") {
      k1 = "Mile per hour";
      k2 = "Mile per hour";
      return (DropdownButton<String>(
        items: speed
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        isExpanded: true,
        icon: Icon(FontAwesomeIcons.anglesDown, color: Colors.black),
        iconSize: 25,
        onChanged: (val) {
          setState(() {
            speed1 = val;
            k1 = val;
          });
        },
        value: speed1,
      ));
    } else {
      k1 = "Degree Celsius";
      k2 = "Degree Celsius";
      return (DropdownButton<String>(
        items: temperature
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        isExpanded: true,
        icon: Icon(FontAwesomeIcons.anglesDown, color: Colors.black),
        iconSize: 25,
        onChanged: (val) {
          setState(() {
            temp1 = val;
            k1 = val;
          });
        },
        value: temp1,
      ));
    }
  }

  Widget func2(String? dropdownvalue) {
    if (_dropdownvalue == "Length") {
      return (DropdownButton<String>(
        items: length
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        isExpanded: true,
        icon: Icon(FontAwesomeIcons.anglesDown, color: Colors.black),
        iconSize: 25,
        onChanged: (val) {
          setState(() {
            length2 = val;
            k2 = val;
          });
        },
        value: length2,
      ));
    } else if (_dropdownvalue == "Mass") {
      return (DropdownButton<String>(
        items: mass
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        isExpanded: true,
        icon: Icon(FontAwesomeIcons.anglesDown, color: Colors.black),
        iconSize: 25,
        onChanged: (val) {
          setState(() {
            mass2 = val;
            k2 = val;
          });
        },
        value: mass2,
      ));
    } else if (_dropdownvalue == "Speed") {
      return (DropdownButton<String>(
        items: speed
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        isExpanded: true,
        icon: Icon(FontAwesomeIcons.anglesDown, color: Colors.black),
        iconSize: 25,
        onChanged: (val) {
          setState(() {
            speed2 = val;
            k2 = val;
          });
        },
        value: speed2,
      ));
    } else {
      return (DropdownButton<String>(
        items: temperature
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        isExpanded: true,
        icon: Icon(FontAwesomeIcons.anglesDown, color: Colors.black),
        iconSize: 25,
        onChanged: (val) {
          setState(() {
            temp2 = val;
            k2 = val;
          });
        },
        value: temp2,
      ));
    }
  }
}
