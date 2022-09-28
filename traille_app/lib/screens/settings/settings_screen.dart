import 'package:flutter/material.dart';
import 'package:traille_app/screens/settings/Components/body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text(
        "Menú",
        style: TextStyle(fontSize: 30),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
