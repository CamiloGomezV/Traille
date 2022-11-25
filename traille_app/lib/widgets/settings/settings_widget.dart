import 'package:flutter/material.dart';
import 'package:traille_app/utils/responsive/responsive.dart';
import 'package:traille_app/utils/settings/item_card.dart';
import 'package:traille_app/utils/notifications/notification2.dart';
import 'package:traille_app/ui/pages/appearance/appearancePage.dart';


class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context: context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ItemCard(
                  title: "Agregar nuevo dispositivo",
                  icon: Icon(
                    Icons.add,
                    size: responsive.wp(10),
                    color:Theme.of(context).iconTheme.color
                  ),
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/bluetooth', (Route<dynamic> route) => false);
                  },
                  //onpress: () {},
                ),
                SizedBox(height: responsive.hp(1.2)),
                ItemCard(
                  title: "Notificaciones",
                  icon: Icon(
                    Icons.notifications,
                    size: responsive.wp(10),
                    color:Theme.of(context).iconTheme.color
                  ),
                  onpress: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => notification2()),
                    );},
                ),
                SizedBox(
                  height: responsive.hp(1.2),
                ),
                ItemCard(
                  title: "Apariencia",
                  icon: Icon(
                    Icons.palette,
                    size: responsive.wp(10),
                    color:Theme.of(context).iconTheme.color
                  ),
                  onpress: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  appearance()),
                    );},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
