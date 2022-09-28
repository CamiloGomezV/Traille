import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final Icon icon;
  //final VoidCallback onpress;

  const ItemCard({
    Key? key,
    required this.title,
    required this.icon,
    //required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(21, 191, 174, 0.4),
                  borderRadius: BorderRadius.all(Radius.circular(17)),
                ),
                height: 50,
                width: 50,
                child: icon),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
