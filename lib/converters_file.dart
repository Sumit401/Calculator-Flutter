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
  String? text_input_field = "";
  String? calculated_value = "";
  late TextEditingController _c;

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
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      text_input_field = value;
                      print(value);
                    },
                    controller: _c,
                  )),
                  VerticalDivider(
                    width: 40,
                  ),
                  Expanded(child: Text(text_input_field!))
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
            ElevatedButton(
              onPressed: () {
                setState(() {
                  var c = double.parse(_c.text);
                  calculation_func(c);
                });
              },
              child: Text("Check"),
            )
          ],
        ));
  }

//////////////////// Function to Do Calculations//////////////////////////////////////
/////////////////////// For length calculation//////////////////////////////////////

  void calculation_func(double c) {
    if (_dropdownvalue == "Length") {
      if (length1 == "Centimeter") {
        if (length2 == "Centimeter") {
          calculated_value = c.toString();
        } else if (length2 == "Kilometre") {
          calculated_value = (c / 100000).toString();
        } else if (length2 == "Millimetre") {
          calculated_value = (c * 10).toString();
        } else if (length2 == "Meter") {
          calculated_value = (c / 100).toString();
        } else if (length2 == "Mile") {
          calculated_value = (c / 160900).toString();
        } else if (length2 == "Foot") {
          calculated_value = (c / 30.48).toString();
        } else if (length2 == "Inch") {
          calculated_value = (c * 2.54).toString();
        }
      } else if (length1 == "Kilometre") {
        if (length2 == "Centimeter") {
          calculated_value = (c * 100000).toString();
        } else if (length2 == "Kilometre") {
          calculated_value = (c).toString();
        } else if (length2 == "Millimetre") {
          calculated_value = (c * 1000000).toString();
        } else if (length2 == "Meter") {
          calculated_value = (c * 1000).toString();
        } else if (length2 == "Mile") {
          calculated_value = (c / 1.609).toString();
        } else if (length2 == "Foot") {
          calculated_value = (c * 3281).toString();
        } else if (length2 == "Inch") {
          calculated_value = (c * 39370).toString();
        }
      } else if (length1 == "Millimetre") {
        if (length2 == "Centimeter") {
          calculated_value = (c / 10).toString();
        } else if (length2 == "Kilometre") {
          calculated_value = (c / 1000000).toString();
        } else if (length2 == "Millimetre") {
          calculated_value = (c).toString();
        } else if (length2 == "Meter") {
          calculated_value = (c / 1000).toString();
        } else if (length2 == "Mile") {
          calculated_value = (c / 1609344).toString();
        } else if (length2 == "Foot") {
          calculated_value = (c / 304.8).toString();
        } else if (length2 == "Inch") {
          calculated_value = (c / 25.4).toString();
        }
      } else if (length1 == "Meter") {
        if (length2 == "Centimeter") {
          calculated_value = (c * 10).toString();
        } else if (length2 == "Kilometre") {
          calculated_value = (c / 1000).toString();
        } else if (length2 == "Millimetre") {
          calculated_value = (c * 1000).toString();
        } else if (length2 == "Meter") {
          calculated_value = (c).toString();
        } else if (length2 == "Mile") {
          calculated_value = (c / 1609).toString();
        } else if (length2 == "Foot") {
          calculated_value = (c * 3.281).toString();
        } else if (length2 == "Inch") {
          calculated_value = (c * 39.3701).toString();
        }
      } else if (length1 == "Mile") {
        if (length2 == "Centimeter") {
          calculated_value = (c * 160900).toString();
        } else if (length2 == "Kilometre") {
          calculated_value = (c * 1.609).toString();
        } else if (length2 == "Millimetre") {
          calculated_value = (c * 1609000).toString();
        } else if (length2 == "Meter") {
          calculated_value = (c * 1609).toString();
        } else if (length2 == "Mile") {
          calculated_value = (c).toString();
        } else if (length2 == "Foot") {
          calculated_value = (c * 5280).toString();
        } else if (length2 == "Inch") {
          calculated_value = (c * 63360).toString();
        }
      } else if (length1 == "Foot") {
        if (length2 == "Centimeter") {
          calculated_value = (c * 30.48).toString();
        } else if (length2 == "Kilometre") {
          calculated_value = (c / 3281).toString();
        } else if (length2 == "Millimetre") {
          calculated_value = (c * 304.8).toString();
        } else if (length2 == "Meter") {
          calculated_value = (c / 3.281).toString();
        } else if (length2 == "Mile") {
          calculated_value = (c / 5280).toString();
        } else if (length2 == "Foot") {
          calculated_value = (c * 1).toString();
        } else if (length2 == "Inch") {
          calculated_value = (c * 12).toString();
        }
      } else if (length1 == "Inch") {
        if (length2 == "Centimeter") {
          calculated_value = (c * 2.54).toString();
        } else if (length2 == "Kilometre") {
          calculated_value = (c / 39370).toString();
        } else if (length2 == "Millimetre") {
          calculated_value = (c * 25.4).toString();
        } else if (length2 == "Meter") {
          calculated_value = (c / 39.37).toString();
        } else if (length2 == "Mile") {
          calculated_value = (c / 63360).toString();
        } else if (length2 == "Foot") {
          calculated_value = (c / 12).toString();
        } else if (length2 == "Inch") {
          calculated_value = (c * 1).toString();
        }
      }

      //////////////////// For Mass calculation//////////////////////////////////////
    } else if (_dropdownvalue == "Mass") {
      if (mass1 == "Kilogram") {
        if (mass2 == "Gram") {
          calculated_value = (c * 1000).toString();
        } else if (mass2 == "Imperial ton") {
          calculated_value = (c / 1016).toString();
        } else if (mass2 == "Pound") {
          calculated_value = (c * 2.205).toString();
        } else if (mass2 == "Ounce") {
          calculated_value = (c * 35.274).toString();
        } else if (mass2 == "Kilogram") {
          calculated_value = (c * 1).toString();
        }
      } else if (mass1 == "Gram") {
        if (mass2 == "Gram") {
          calculated_value = (c * 1).toString();
        } else if (mass2 == "Imperial ton") {
          calculated_value = ((c * 9.842) / 10000000).toString();
        } else if (mass2 == "Pound") {
          calculated_value = (c / 453.6).toString();
        } else if (mass2 == "Ounce") {
          calculated_value = (c / 28.35).toString();
        } else if (mass2 == "Kilogram") {
          calculated_value = (c / 1000).toString();
        }
      } else if (mass1 == "Imperial ton") {
        if (mass2 == "Gram") {
          calculated_value = (c * 1016046.91).toString();
        } else if (mass2 == "Imperial ton") {
          calculated_value = (c).toString();
        } else if (mass2 == "Pound") {
          calculated_value = (c * 2240).toString();
        } else if (mass2 == "Ounce") {
          calculated_value = (c * 35840).toString();
        } else if (mass2 == "Kilogram") {
          calculated_value = (c * 1016).toString();
        }
      } else if (mass1 == "Pound") {
        if (mass2 == "Gram") {
          calculated_value = (c * 453.6).toString();
        } else if (mass2 == "Imperial ton") {
          calculated_value = (c / 2240).toString();
        } else if (mass2 == "Pound") {
          calculated_value = (c * 1).toString();
        } else if (mass2 == "Ounce") {
          calculated_value = (c * 16).toString();
        } else if (mass2 == "Kilogram") {
          calculated_value = (c / 2.205).toString();
        }
      } else if (mass1 == "Ounce") {
        if (mass2 == "Gram") {
          calculated_value = (c * 28.35).toString();
        } else if (mass2 == "Imperial ton") {
          calculated_value = (c / 35840).toString();
        } else if (mass2 == "Pound") {
          calculated_value = (c / 16).toString();
        } else if (mass2 == "Ounce") {
          calculated_value = (c * 1).toString();
        } else if (mass2 == "Kilogram") {
          calculated_value = (c / 35.274).toString();
        }
      }

      /////////////////////////////// For Speed Calculations //////////////////////////////////////

    } else if (_dropdownvalue == "Speed") {
      if (speed1 == "Mile per hour") {
        if (speed2 == "Meter per second") {
          calculated_value = (c / 2.237).toString();
        } else if (speed2 == "Kilometer per hour") {
          calculated_value = (c * 1.609).toString();
        } else if (speed2 == "Knot") {
          calculated_value = (c / 1.151).toString();
        } else if (speed2 == "Mile per hour") {
          calculated_value = (c).toString();
        }
      } else if (speed1 == "Meter per second") {
        if (speed2 == "Meter per second") {
          calculated_value = (c).toString();
        } else if (speed2 == "Kilometer per hour") {
          calculated_value = (c * 3.6).toString();
        } else if (speed2 == "Knot") {
          calculated_value = (c * 1.944).toString();
        } else if (speed2 == "Mile per hour") {
          calculated_value = (c * 2.237).toString();
        }
      } else if (speed1 == "Kilometer per hour") {
        if (speed2 == "Meter per second") {
          calculated_value = (c / 3.6).toString();
        } else if (speed2 == "Kilometer per hour") {
          calculated_value = (c).toString();
        } else if (speed2 == "Knot") {
          calculated_value = (c / 1.852).toString();
        } else if (speed2 == "Mile per hour") {
          calculated_value = (c / 1.609).toString();
        }
      } else if (speed1 == "Knot") {
        if (speed2 == "Meter per second") {
          calculated_value = (c / 1.944).toString();
        } else if (speed2 == "Kilometer per hour") {
          calculated_value = (c * 1.852).toString();
        } else if (speed2 == "Knot") {
          calculated_value = (c).toString();
        } else if (speed2 == "Mile per hour") {
          calculated_value = (c * 1.151).toString();
        }
      }
    }
    /////////////////////////////// For Temperature Calculations //////////////////////////////////////
    else if (_dropdownvalue == "Temperature") {
      if (temp1 == "Degree Celsius") {
        if (temp2 == "Degree Celsius") {
          calculated_value = (c).toString();
        } else if (temp2 == "Fahrenheit") {
          calculated_value = ((c * 9 / 5) + 32).toString();
        } else if (temp2 == "Kelvin") {
          calculated_value = (c + 273.15).toString();
        }
      } else if (temp1 == "Fahrenheit") {
        if (temp2 == "Degree Celsius") {
          calculated_value = ((c - 32) * (5 / 9)).toString();
        } else if (temp2 == "Fahrenheit") {
          calculated_value = (c).toString();
        } else if (temp2 == "Kelvin") {
          calculated_value = (((c - 32) * (5 / 9)) + 273.15).toString();
        }
      } else if (temp1 == "Kelvin") {
        if (temp2 == "Degree Celsius") {
          calculated_value = (c - 273.15).toString();
        } else if (temp2 == "Fahrenheit") {
          calculated_value = (((c - 273.15) * (9 / 5)) + 32).toString();
        } else if (temp2 == "Kelvin") {
          calculated_value = (c).toString();
        }
      }
    }
    //////////////// Set state function to carry out updated task..../////////////////////////
    setState(() {
      text_input_field = calculated_value;
    });
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
