import 'package:flutter/material.dart';
import 'package:traille_app/utils/responsive/responsive.dart';

class Screen0 extends StatelessWidget {
  const Screen0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context: context);
    return Container(
      color: Colors.white,
      child: Column(children: <Widget>[
        SizedBox(
          height: responsive.hp(20),
        ),
        Text(
          "¡Bienvenido a Traille!",
          style: TextStyle(
              fontSize: responsive.wp(8),
              color: const Color.fromARGB(255, 30, 120, 112)),
        ),
        SizedBox(
          height: responsive.hp(5),
        ),
        Image.asset(
          'assets/icons/logo.png',
          width: responsive.wp(90),
        ),
      ]),
    );
  }
}
