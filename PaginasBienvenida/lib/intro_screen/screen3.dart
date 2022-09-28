import 'package:flutter/material.dart';


class screen3 extends StatelessWidget{

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
            child: Image.asset('assets/comunicacion.png',width: 240,),),
          Container(
            width: 48.0,
            height: 30.0,
            child: const Text(" "),
          ),
          Container(
            child: const Text("Corta todas las limitaciones", style: TextStyle(fontSize: 23, color: Color.fromARGB(255, 30, 120, 112)),),
            ),
          Container(
            child: const Text("en la comunicación.", style: TextStyle(fontSize: 23, color: Color.fromARGB(255, 30, 120, 112)),),
            ),
        ]
       ),

    );
  }
}