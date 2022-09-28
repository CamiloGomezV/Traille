import 'package:flutter/material.dart';

class screen1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[ 
          Container(
            width: 48.0,
            height: 200.0,
            child: const Text(" "),
          ),
          Container(
            child: Image.asset('assets/amigos.png',width: 320,),),
          Container(
            width: 48.0,
            height:50.0,
            child: const Text(" "),
          ),
          Container(
            child: const Text("Comunicate confiadamente con", style: TextStyle(fontSize: 23, color: Color.fromARGB(255, 30, 120, 112)),),
            ),
          Container(
            child: const Text("tus amigos sordo-ciegos", style: TextStyle(fontSize: 23, color: Color.fromARGB(255, 30, 120, 112)),),
          )
        ]
       ),
    );
  }
}