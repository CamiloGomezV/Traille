import 'package:flutter/material.dart';
import 'package:traille_app/utils/responsive/responsive.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function ()? onpress;
  //final VoidCallback onpress;

  const ItemCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context:context);
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
                decoration:  BoxDecoration(
                  color: const Color.fromRGBO(21, 191, 174, 0.4),
                  borderRadius: BorderRadius.all(Radius.circular(responsive.hp(2))),
                ),
                height: responsive.hp(6),
                width: responsive.wp(13),
                child: icon),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
            child: Text(
              title,
              style: TextStyle(fontSize: responsive.wp(3.6), color:Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
