import 'package:flutter/material.dart';
import 'package:traille_app/utils/responsive/responsive.dart';
import 'package:traille_app/widgets/chat/chats_widget.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const ChatsWidget(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final Responsive responsive = Responsive(context:context);
    return AppBar(
      elevation: 0,
      title: Text(
        "Traille",
        style: TextStyle(fontSize: responsive.wp(7), color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
