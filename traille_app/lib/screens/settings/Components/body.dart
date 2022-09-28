import 'package:flutter/material.dart';
import 'package:traille_app/screens/settings/Components/item_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ItemCard(
                  title: "Agregar nuevo dispositivo",
                  icon: Icon(
                    Icons.add,
                    size: 39,
                  ),
                  //onpress: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                ItemCard(
                  title: "Notificaciones",
                  icon: Icon(
                    Icons.notifications,
                    size: 35,
                  ),
                  //onpress: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                ItemCard(
                  title: "Apariencia",
                  icon: Icon(
                    Icons.palette,
                    size: 32,
                  ),
                  //onpress: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
