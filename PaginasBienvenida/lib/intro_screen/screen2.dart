import 'package:flutter/material.dart';


class screen2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget> [ 
          Container(
            width: 48.0,
            height: 160.0,
            child: const Text(" "),
          ),
          Container(
            child: Image.asset('assets/chat.png',width: 250,),),
          Container(
            width: 48.0,
            height: 20.0,
            child: const Text(" "),
          ),
          Container(
            child: const Text("Crea chats fácilmente", style: TextStyle(fontSize: 23, color: Color.fromARGB(255, 30, 120, 112)),),
            ),
      // Text("Crea chats fácilmente"),
        ]
       ),
    );
  }
}