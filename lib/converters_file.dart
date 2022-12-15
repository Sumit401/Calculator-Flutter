import 'package:flutter/material.dart';
import 'package:project/Navigation_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/Responsive.dart';
import 'package:project/TopBarContent.dart';

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
  String? text_input_field = "Output";
  String? calculated_value = "";
  late TextEditingController _c;


  @override
  void initState() {
    _c = TextEditingController(text: "");
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _c.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var screen_size=MediaQuery.of(context).size;
    return Scaffold(
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(title: Text("Converter"))
            : PreferredSize(
                child: TopBarContent(), preferredSize: Size(screen_size.width, 70)),
        drawer: Navigation_drawer(),
        body:Container(
          height: screen_size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
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
                            border: OutlineInputBorder(), labelText: "Enter Value"),
                        controller: _c,
                      )),
                      VerticalDivider(
                        width: 40,
                      ),
                      Expanded(
                          child: SizedBox(
                              child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black54,
                              width: 2,
                              strokeAlign: StrokeAlign.outside,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.all(15),
                        child: Text(text_input_field!),
                      )))
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
                Container(
                  margin: EdgeInsets.only(bottom: 30,top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        var c = double.parse(_c.text);
                        calculation_func(c);
                      });
                    },
                    child: Text("Check"),
                  ),
                )
              ],
            ),
          ),
        ));
  }

//////////////////// Function to Do Calculations//////////////////////////////////////
/////////////////////// For length calculation//////////////////////////////////////

  void calculation_func(double c) {
    if (_dropdownvalue == "Length") {
      if (length1 == "Centimeter") {
        if (length2 == "Centimeter") {
          calculated_value = c.toStringAsFixed(3);
        } else if (length2 == "Kilometre") {
          calculated_value = (c / 100000).toStringAsFixed(3);
        } else if (length2 == "Millimetre") {
          calculated_value = (c * 10).toStringAsFixed(3);
        } else if (length2 == "Meter") {
          calculated_value = (c / 100).toStringAsFixed(3);
        } else if (length2 == "Mile") {
          calculated_value = (c / 160900).toStringAsFixed(3);
        } else if (length2 == "Foot") {
          calculated_value = (c / 30.48).toStringAsFixed(3);
        } else if (length2 == "Inch") {
          calculated_value = (c * 2.54).toStringAsFixed(3);
        }
      } else if (length1 == "Kilometre") {
        if (length2 == "Centimeter") {
          calculated_value = (c * 100000).toStringAsFixed(3);
        } else if (length2 == "Kilometre") {
          calculated_value = (c).toStringAsFixed(3);
        } else if (length2 == "Millimetre") {
          calculated_value = (c * 1000000).toStringAsFixed(3);
        } else if (length2 == "Meter") {
          calculated_value = (c * 1000).toStringAsFixed(3);
        } else if (length2 == "Mile") {
          calculated_value = (c / 1.609).toStringAsFixed(3);
        } else if (length2 == "Foot") {
          calculated_value = (c * 3281).toStringAsFixed(3);
        } else if (length2 == "Inch") {
          calculated_value = (c * 39370).toStringAsFixed(3);
        }
      } else if (length1 == "Millimetre") {
        if (length2 == "Centimeter") {
          calculated_value = (c / 10).toStringAsFixed(3);
        } else if (length2 == "Kilometre") {
          calculated_value = (c / 1000000).toStringAsFixed(3);
        } else if (length2 == "Millimetre") {
          calculated_value = (c).toStringAsFixed(3);
        } else if (length2 == "Meter") {
          calculated_value = (c / 1000).toStringAsFixed(3);
        } else if (length2 == "Mile") {
          calculated_value = (c / 1609344).toStringAsFixed(3);
        } else if (length2 == "Foot") {
          calculated_value = (c / 304.8).toStringAsFixed(3);
        } else if (length2 == "Inch") {
          calculated_value = (c / 25.4).toStringAsFixed(3);
        }
      } else if (length1 == "Meter") {
        if (length2 == "Centimeter") {
          calculated_value = (c * 100).toStringAsFixed(3);
        } else if (length2 == "Kilometre") {
          calculated_value = (c / 1000).toStringAsFixed(3);
        } else if (length2 == "Millimetre") {
          calculated_value = (c * 1000).toStringAsFixed(3);
        } else if (length2 == "Meter") {
          calculated_value = (c).toStringAsFixed(3);
        } else if (length2 == "Mile") {
          calculated_value = (c / 1609).toStringAsFixed(3);
        } else if (length2 == "Foot") {
          calculated_value = (c * 3.281).toStringAsFixed(3);
        } else if (length2 == "Inch") {
          calculated_value = (c * 39.3701).toStringAsFixed(3);
        }
      } else if (length1 == "Mile") {
        if (length2 == "Centimeter") {
          calculated_value = (c * 160900).toStringAsFixed(3);
        } else if (length2 == "Kilometre") {
          calculated_value = (c * 1.609).toStringAsFixed(3);
        } else if (length2 == "Millimetre") {
          calculated_value = (c * 1609000).toStringAsFixed(3);
        } else if (length2 == "Meter") {
          calculated_value = (c * 1609).toStringAsFixed(3);
        } else if (length2 == "Mile") {
          calculated_value = (c).toStringAsFixed(3);
        } else if (length2 == "Foot") {
          calculated_value = (c * 5280).toStringAsFixed(3);
        } else if (length2 == "Inch") {
          calculated_value = (c * 63360).toStringAsFixed(3);
        }
      } else if (length1 == "Foot") {
        if (length2 == "Centimeter") {
          calculated_value = (c * 30.48).toStringAsFixed(3);
        } else if (length2 == "Kilometre") {
          calculated_value = (c / 3281).toStringAsFixed(3);
        } else if (length2 == "Millimetre") {
          calculated_value = (c * 304.8).toStringAsFixed(3);
        } else if (length2 == "Meter") {
          calculated_value = (c / 3.281).toStringAsFixed(3);
        } else if (length2 == "Mile") {
          calculated_value = (c / 5280).toStringAsFixed(3);
        } else if (length2 == "Foot") {
          calculated_value = (c * 1).toStringAsFixed(3);
        } else if (length2 == "Inch") {
          calculated_value = (c * 12).toStringAsFixed(3);
        }
      } else if (length1 == "Inch") {
        if (length2 == "Centimeter") {
          calculated_value = (c * 2.54).toStringAsFixed(3);
        } else if (length2 == "Kilometre") {
          calculated_value = (c / 39370).toStringAsFixed(3);
        } else if (length2 == "Millimetre") {
          calculated_value = (c * 25.4).toStringAsFixed(3);
        } else if (length2 == "Meter") {
          calculated_value = (c / 39.37).toStringAsFixed(3);
        } else if (length2 == "Mile") {
          calculated_value = (c / 63360).toStringAsFixed(3);
        } else if (length2 == "Foot") {
          calculated_value = (c / 12).toStringAsFixed(3);
        } else if (length2 == "Inch") {
          calculated_value = (c * 1).toStringAsFixed(3);
        }
      }

      //////////////////// For Mass calculation//////////////////////////////////////
    } else if (_dropdownvalue == "Mass") {
      if (mass1 == "Kilogram") {
        if (mass2 == "Gram") {
          calculated_value = (c * 1000).toStringAsFixed(3);
        } else if (mass2 == "Imperial ton") {
          calculated_value = (c / 1016).toStringAsFixed(3);
        } else if (mass2 == "Pound") {
          calculated_value = (c * 2.205).toStringAsFixed(3);
        } else if (mass2 == "Ounce") {
          calculated_value = (c * 35.274).toStringAsFixed(3);
        } else if (mass2 == "Kilogram") {
          calculated_value = (c * 1).toStringAsFixed(3);
        }
      } else if (mass1 == "Gram") {
        if (mass2 == "Gram") {
          calculated_value = (c * 1).toStringAsFixed(3);
        } else if (mass2 == "Imperial ton") {
          calculated_value = ((c * 9.842) / 10000000).toStringAsFixed(3);
        } else if (mass2 == "Pound") {
          calculated_value = (c / 453.6).toStringAsFixed(3);
        } else if (mass2 == "Ounce") {
          calculated_value = (c / 28.35).toStringAsFixed(3);
        } else if (mass2 == "Kilogram") {
          calculated_value = (c / 1000).toStringAsFixed(3);
        }
      } else if (mass1 == "Imperial ton") {
        if (mass2 == "Gram") {
          calculated_value = (c * 1016046.91).toStringAsFixed(3);
        } else if (mass2 == "Imperial ton") {
          calculated_value = (c).toStringAsFixed(3);
        } else if (mass2 == "Pound") {
          calculated_value = (c * 2240).toStringAsFixed(3);
        } else if (mass2 == "Ounce") {
          calculated_value = (c * 35840).toStringAsFixed(3);
        } else if (mass2 == "Kilogram") {
          calculated_value = (c * 1016).toStringAsFixed(3);
        }
      } else if (mass1 == "Pound") {
        if (mass2 == "Gram") {
          calculated_value = (c * 453.6).toStringAsFixed(3);
        } else if (mass2 == "Imperial ton") {
          calculated_value = (c / 2240).toStringAsFixed(3);
        } else if (mass2 == "Pound") {
          calculated_value = (c * 1).toStringAsFixed(3);
        } else if (mass2 == "Ounce") {
          calculated_value = (c * 16).toStringAsFixed(3);
        } else if (mass2 == "Kilogram") {
          calculated_value = (c / 2.205).toStringAsFixed(3);
        }
      } else if (mass1 == "Ounce") {
        if (mass2 == "Gram") {
          calculated_value = (c * 28.35).toStringAsFixed(3);
        } else if (mass2 == "Imperial ton") {
          calculated_value = (c / 35840).toStringAsFixed(3);
        } else if (mass2 == "Pound") {
          calculated_value = (c / 16).toStringAsFixed(3);
        } else if (mass2 == "Ounce") {
          calculated_value = (c * 1).toStringAsFixed(3);
        } else if (mass2 == "Kilogram") {
          calculated_value = (c / 35.274).toStringAsFixed(3);
        }
      }

      /////////////////////////////// For Speed Calculations //////////////////////////////////////

    } else if (_dropdownvalue == "Speed") {
      if (speed1 == "Mile per hour") {
        if (speed2 == "Meter per second") {
          calculated_value = (c / 2.237).toStringAsFixed(3);
        } else if (speed2 == "Kilometer per hour") {
          calculated_value = (c * 1.609).toStringAsFixed(3);
        } else if (speed2 == "Knot") {
          calculated_value = (c / 1.151).toStringAsFixed(3);
        } else if (speed2 == "Mile per hour") {
          calculated_value = (c).toStringAsFixed(3);
        }
      } else if (speed1 == "Meter per second") {
        if (speed2 == "Meter per second") {
          calculated_value = (c).toStringAsFixed(3);
        } else if (speed2 == "Kilometer per hour") {
          calculated_value = (c * 3.6).toStringAsFixed(3);
        } else if (speed2 == "Knot") {
          calculated_value = (c * 1.944).toStringAsFixed(3);
        } else if (speed2 == "Mile per hour") {
          calculated_value = (c * 2.237).toStringAsFixed(3);
        }
      } else if (speed1 == "Kilometer per hour") {
        if (speed2 == "Meter per second") {
          calculated_value = (c / 3.6).toStringAsFixed(3);
        } else if (speed2 == "Kilometer per hour") {
          calculated_value = (c).toStringAsFixed(3);
        } else if (speed2 == "Knot") {
          calculated_value = (c / 1.852).toStringAsFixed(3);
        } else if (speed2 == "Mile per hour") {
          calculated_value = (c / 1.609).toStringAsFixed(3);
        }
      } else if (speed1 == "Knot") {
        if (speed2 == "Meter per second") {
          calculated_value = (c / 1.944).toStringAsFixed(3);
        } else if (speed2 == "Kilometer per hour") {
          calculated_value = (c * 1.852).toStringAsFixed(3);
        } else if (speed2 == "Knot") {
          calculated_value = (c).toStringAsFixed(3);
        } else if (speed2 == "Mile per hour") {
          calculated_value = (c * 1.151).toStringAsFixed(3);
        }
      }
    }
    /////////////////////////////// For Temperature Calculations //////////////////////////////////////
    else if (_dropdownvalue == "Temperature") {
      if (temp1 == "Degree Celsius") {
        if (temp2 == "Degree Celsius") {
          calculated_value = (c).toStringAsFixed(3);
        } else if (temp2 == "Fahrenheit") {
          calculated_value = ((c * 9 / 5) + 32).toStringAsFixed(3);
        } else if (temp2 == "Kelvin") {
          calculated_value = (c + 273.15).toStringAsFixed(3);
        }
      } else if (temp1 == "Fahrenheit") {
        if (temp2 == "Degree Celsius") {
          calculated_value = ((c - 32) * (5 / 9)).toStringAsFixed(3);
        } else if (temp2 == "Fahrenheit") {
          calculated_value = (c).toStringAsFixed(3);
        } else if (temp2 == "Kelvin") {
          calculated_value = (((c - 32) * (5 / 9)) + 273.15).toStringAsFixed(3);
        }
      } else if (temp1 == "Kelvin") {
        if (temp2 == "Degree Celsius") {
          calculated_value = (c - 273.15).toStringAsFixed(3);
        } else if (temp2 == "Fahrenheit") {
          calculated_value = (((c - 273.15) * (9 / 5)) + 32).toStringAsFixed(3);
        } else if (temp2 == "Kelvin") {
          calculated_value = (c).toStringAsFixed(3);
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
