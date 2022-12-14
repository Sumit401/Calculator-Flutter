import 'package:flutter/material.dart';
import 'package:project/Contact_us.dart';
import 'package:project/basic.dart';
import 'package:project/converters_file.dart';
import 'package:project/scientific.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navigation_drawer extends StatelessWidget {
  const Navigation_drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, 60, 0, 20),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: ExactAssetImage('assets/images/calc_icon.jpg'),
                              fit: BoxFit.fill)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: const Text(
                        "Scientific Calculator",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 20, left: 20),
              leading: Icon(FontAwesomeIcons.calculator,size: 18,
                  color: Colors.black),
              title: Text(
                "Basic Calculator",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              onTap: () => {
                Navigator.of(context).pop(),
                Navigator.of(context).pushNamed(Main_screen.route)
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 20, left: 20),
              leading: Icon(FontAwesomeIcons.squareRootVariable,size: 18,
                color: Colors.black,),
              title: Text(
                "Scientific Calculator",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              onTap: () => {
                Navigator.of(context).pop(),
                Navigator.of(context).pushNamed(Scientific.route)
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 20, left: 20),
              leading: Icon(FontAwesomeIcons.leftRight,size: 18,
                color: Colors.black,),
              title: Text(
                "Converter",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              onTap: () => {
                Navigator.of(context).pop(),
                Navigator.of(context).pushNamed(Converters_File.route),
              },
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ListTile(
                contentPadding: EdgeInsets.only(top: 20, left: 20),
                leading: Icon(FontAwesomeIcons.circleInfo,size: 18,
                    color: Colors.black),
                title: Text(
                  "About Us",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                onTap: () => {
                  Navigator.of(context).pop(),
                  Navigator.of(context).pushNamed(Contactus.route)
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
