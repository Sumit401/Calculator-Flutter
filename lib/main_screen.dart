import 'package:flutter/material.dart';

import '';
class Main_screen extends StatefulWidget {
  const Main_screen({Key? key}) : super(key: key);

  @override
  State<Main_screen> createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {

  // Function to Carry operations
  String todisplayoutput="";
  int first_num=0;
  int second_num=0;
  String operat="";
  String res="";
  void tasktocarry(String val)
  {
    //print(val);
      if(val=="C")
        {
          first_num=0;
          second_num=0;
          res="";
          operat="";
        }
      else if(val=="+"||val=="-"||val=="X"||val=="/")
        {
          operat=val;
          first_num=int.parse(todisplayoutput);
          res="";
        }
      else if(val=="="){
        second_num=int.parse(todisplayoutput);
        if(operat=="+")
          {
            res=(first_num+second_num).toString();
          }
        else if(operat=="-")
        {
          res=(first_num-second_num).toString();
        }
        else if(operat=="X")
        {
          res=(first_num*second_num).toString();
        }  else if(operat=="/")
        {
          res=(first_num/second_num).toString();
        }
      }
      else{
        res=todisplayoutput+val;
      }
      //set state function......................
      setState(() {
        todisplayoutput=res;
      });
  }
  // Function for Buttons
  Widget custom_btn(String value)
  {
    return(Expanded(child: (OutlinedButton(onPressed:() => tasktocarry(value) ,child:Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(value,style:TextStyle(fontSize: 30,color: Colors.black),),
    ),))));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Basic Calculator")),
        body: Container(child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(child: Text(todisplayoutput,style: TextStyle(fontSize: 40),),alignment: Alignment.bottomRight,),
              )),
              Row(
                  children: [
                    custom_btn("9"),
                    custom_btn("8"),
                    custom_btn("7"),
                    custom_btn("+")
                  ]),
              Row(
                  children: [
                    custom_btn("6"),
                    custom_btn("5"),
                    custom_btn("4"),
                    custom_btn("-")
                  ]),
              Row(
                  children: [
                    custom_btn("3"),
                    custom_btn("2"),
                    custom_btn("1"),
                    custom_btn("X")
                  ]),
              Row(

                  children: [
                    custom_btn("C"),
                    custom_btn("0"),
                    custom_btn("="),
                    custom_btn("/")
                  ])
            ],
          ),
        )
        )
    );
  }
}
