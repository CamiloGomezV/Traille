import 'package:flutter/material.dart';
import 'package:traille_app/screens/chats/Components/body.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

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
        "Traille",
        style: TextStyle(fontSize: 30),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
