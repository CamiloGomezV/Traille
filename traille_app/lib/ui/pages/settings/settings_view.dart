import 'package:flutter/material.dart';
import 'package:traille_app/utils/responsive/responsive.dart';
import 'package:traille_app/widgets/settings/settings_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const SettingsWidget(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final Responsive responsive = Responsive(context: context);
    return AppBar(
      elevation: 0,
      title: Text(
        "Menú",
        style: TextStyle(fontSize: responsive.wp(7), color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
