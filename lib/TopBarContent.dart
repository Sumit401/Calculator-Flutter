import 'package:flutter/material.dart';

class TopBarContent extends StatefulWidget {
  const TopBarContent({Key? key}) : super(key: key);

  @override
  State<TopBarContent> createState() => _TopBarContentState();
}

class _TopBarContentState extends State<TopBarContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text("Calculator",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30,color: Colors.white)),
              margin: EdgeInsets.only(right: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Basic Calculator",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 15,color: Colors.white))),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Scientific Calculator",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 15,color: Colors.white))),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Converter",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 15,color: Colors.white))),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Contact Us",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 15,color: Colors.white))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
