import 'package:flutter/material.dart';
import 'package:traille_app/utils/responsive/responsive.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context: context);
    return Container(
      color: Colors.white,
      child: Column(children: <Widget>[
        SizedBox(
          height: responsive.hp(30),
        ),
        Image.asset('assets/images/amigos.png', width: responsive.wp(95)),
        SizedBox(
          height: responsive.hp(4),
        ),
        Container(
          alignment: Alignment.center,
          width: responsive.wp(80),
          height: responsive.hp(10),
          child: Text(
            "Comunicate confiadamente con tus amifos sordo-ciegos",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: responsive.wp(6),
                color: const Color.fromARGB(255, 30, 120, 112)),
          ),
        ),
      ]),
    );
  }
}
