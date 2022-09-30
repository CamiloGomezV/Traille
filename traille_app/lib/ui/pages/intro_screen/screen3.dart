import 'package:flutter/material.dart';
import 'package:traille_app/utils/responsive/responsive.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context: context);
    return Container(
      color: Colors.white,
      child: Column(children: <Widget>[
        SizedBox(
          height: responsive.hp(23),
        ),
        Image.asset(
          'assets/images/comunicacion.png',
          width: responsive.wp(75),
        ),
        SizedBox(
          height: responsive.hp(2),
        ),
        Container(
          alignment: Alignment.center,
          width: responsive.wp(80),
          height: responsive.hp(10),
          child: Text(
            "Corta todas las limitaciones en la comunicación",
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
