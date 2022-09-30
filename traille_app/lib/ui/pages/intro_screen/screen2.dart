import 'package:flutter/material.dart';
import 'package:traille_app/utils/responsive/responsive.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context: context);
    return Container(
      color: Colors.white,
      child: Column(children: <Widget>[
        SizedBox(
          height: responsive.hp(25),
        ),
        Image.asset(
          'assets/images/chat.png',
          width: responsive.wp(75),
        ),
        SizedBox(
          height: responsive.hp(2),
        ),
        Text(
          "Crea chats fácilmente",
          style: TextStyle(
              fontSize: responsive.wp(6),
              color: const Color.fromARGB(255, 30, 120, 112)),
        ),
        // Text("Crea chats fácilmente"),
      ]),
    );
  }
}
