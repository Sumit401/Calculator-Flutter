import 'package:flutter/material.dart';
import 'package:project/Navigation_drawer.dart';
import 'package:project/Responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/TopBarContent.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Contactus extends StatefulWidget {
  static const route = "/Contactus";

  const Contactus({Key? key}) : super(key: key);

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    // Whatsapp Link

    var screen_size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar()
          : PreferredSize(
              preferredSize: Size(screen_size.width, 70),
              child: TopBarContent()),
      drawer: Navigation_drawer(),

      body: Container(
        color: Colors.white,
        height: screen_size.height,
        alignment: Alignment.topCenter,
        //color: Colors.red,
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text("All in one Calculator created on Flutter!",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                  child: Container(
                    child: Text(
                      "A Calculator that you can use on all the Platforms either it's Android or IOS or Web Application or Desktop Application (Supports Linux, Windows, MacOS) ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: SingleChildScrollView(
        child: Container(
          alignment: Alignment.bottomCenter,
          /*alignment: Alignment.bottomCenter,*/
          color: Colors.brown,
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20),
                    child: Text("Get In Touch",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20),
                    child: Text("Any Question or Remarks ? Just write us a Message.",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white)),
                  ),
                ],
              ),
              Container(

                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Column(
                        children: [
                          Container(
                              child: Icon(FontAwesomeIcons.phoneVolume,color: Colors.white),
                              margin: EdgeInsets.only(bottom: 10)),
                          Container(child: Text("8210794699",style: TextStyle(color:  Colors.white),)),
                        ],
                      ),
                      onTap: () {
                        whatsapp_launch();
                      },
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Container(
                              child: Icon(FontAwesomeIcons.envelope,color: Colors.white,),
                              margin: EdgeInsets.only(bottom: 10)),
                          Container(
                            child: Text("sumitsinha401@gmail.com",style: TextStyle(color:  Colors.white)),
                          )
                        ],
                      ),
                      onTap: () {
                        mail_launch();
                      },
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Container(
                              child: Icon(FontAwesomeIcons.locationDot,color: Colors.white,),
                              margin: EdgeInsets.only(bottom: 10)),
                          Container(
                            child: Text("Patna, Bihar",style: TextStyle(color:  Colors.white)),
                          )
                        ],
                      ),
                      onTap: () {
                        maps_launch();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void whatsapp_launch() async {
  String whatsapp_url = "https://wa.me/8210794699";
  await launchUrlString(whatsapp_url);
}

// Mail Link
void mail_launch() async {
  String mail_url = "mailto:sumitsinha401@gmail.com";
  await launchUrlString(mail_url);
}

// Maps Link
void maps_launch() async {
  String maps_url = "https://goo.gl/maps/EZxUHRZ7H4ybeBj39";
  await launchUrlString(maps_url);
}
