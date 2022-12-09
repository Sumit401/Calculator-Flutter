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
  var items = [
    "Length",
    "Mass",
    "Speed",
    "Temperature"
  ];
  var subitems1=["Centimeter","Kilometre","Millimetre","Meter","Mile","Foot","Inch"];
  var subitems2=["Kilogram","Gram","Imperial ton","Pound","Ounce"];
  var subitems3=["Mile per hour","Meter per second","Kilometer per hour","Knot"];
  var subitems4=["Degree Celsius","Fahrenheit","Kelvin"];
  //var i=1;
  //var subitems=[{"Centimeter","Kilometre","Millimetre","Meter","Mile","Foot","Inch"},{"Kilogram","Gram","Imperial ton","Pound","Ounce"},
    //{"Mile per hour","Meter per second","Kilometer per hour","Knot"},{"Degree Celsius","Fahrenheit","Kelvin"}];
  //var to=[];
  String? _dropdownvalue = "Length";
  String? _dropdownvalue_subitem1="Centimeter";
  String? _dropdownvalue_subitem2="Kilogram";
  String? _dropdownvalue_subitem3="Degree Celsius";

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
                  child:
                  Container(
                    width: 400,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape
                          .rectangle, /*border: Border.all(color: Colors.black)*/
                    ),
                    child: DropdownButton<String>(
                      items: items.map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              )).toList(),
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
                        border: OutlineInputBorder(), labelText: "Seconds"),
                  )),
                  VerticalDivider(
                    width: 40,
                  ),
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Minute"),
                  ))
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 40, left: 40),
              child:
                Row(
                children: [
                  Expanded(
                    child:
             DropdownButton<String>(
            items: subitems1
                .map((e) => DropdownMenuItem(
            child: Text(e),
            value: e,
            ))
                .toList(),
            isExpanded: true,
            icon: Icon(FontAwesomeIcons.anglesDown,
            color: Colors.black),
            iconSize: 25,
            onChanged: (val) {
            setState(() {
            _dropdownvalue_subitem1 = val;
            });
            },
            value: _dropdownvalue_subitem1,
            ),
                  ),
                  VerticalDivider(
                    width: 40,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      items: subitems1
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      isExpanded: true,
                      icon: Icon(FontAwesomeIcons.anglesDown,
                          color: Colors.black),
                      iconSize: 25,
                      onChanged: (val) {
                        setState(() {
                          _dropdownvalue_subitem1 = val;
                        });
                      },
                      value: _dropdownvalue_subitem1,
                    ),
                  ),
                ],
              ),
            ),

            //ElevatedButton(onPressed: () {}, child: Text("Check"))
          ],
        ));
  }
}