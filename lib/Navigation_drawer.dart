import 'package:flutter/material.dart';
import 'package:project/basic.dart';
import 'package:project/converters_file.dart';
import 'package:project/scientific.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navigation_drawer extends StatelessWidget {
  const Navigation_drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://play-lh.googleusercontent.com/cO4csI8eYgS8jeOHx10oPkp1TbrCD34JpXxxlodZQYy8dvTR9kHkKXerSAU1GuBHQuxV=w240-h480-rw"),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    child: Text(
                      "Scientific Calculator",
                      style: TextStyle(color: Colors.white),
                    ),
                    margin: EdgeInsets.only(top: 10),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top: 20, left: 20),
            leading: Icon(FontAwesomeIcons.calculator,size: 20,
                color: Colors.black),
            title: Text(
              "Basic Calculator",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            onTap: () => {
              Navigator.pop(context),
              Navigator.of(context).pushNamed(Main_screen.route)
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top: 20, left: 20),
            leading: Icon(FontAwesomeIcons.squareRootVariable,size: 20,
              color: Colors.black,),
            title: Text(
              "Scientific Calculator",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            onTap: () => {
              Navigator.pop(context),
              Navigator.of(context).pushNamed(Scientific.route)
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top: 20, left: 20),
            leading: Icon(FontAwesomeIcons.leftRight,size: 20,
              color: Colors.black,),
            title: Text(
              "Converter",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            onTap: () => {
              Navigator.pop(context),
              Navigator.of(context).pushNamed(Converters_File.route),
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top: 20, left: 20),
            leading: Icon(FontAwesomeIcons.circleInfo,size: 30,
                color: Colors.black),
            title: Text(
              "About Us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            onTap: () => {
              Navigator.pop(context),
              Navigator.of(context).pushNamed(Converters_File.route),
            },
          )
        ],
      ),
    );
  }
}
