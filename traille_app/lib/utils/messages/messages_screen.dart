import 'package:flutter/material.dart';

import 'package:traille_app/bloc/chat/chat_bloc.dart';
import 'package:traille_app/utils/responsive/responsive.dart';
import 'package:traille_app/widgets/messages/message_widget.dart';

class MessagesScreen extends StatelessWidget {
  final Chat chat;
  const MessagesScreen({
    Key? key,
    required this.chat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context: context);
    return Scaffold(
      appBar: buildAppBar(responsive),
      body: const Messages(),
      bottomNavigationBar: Container(
          padding: MediaQuery.of(context).viewInsets,
          color: Colors.white,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 30),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type a message',
                ),
              ))),
    );
  }

  AppBar buildAppBar(Responsive responsive) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(
            color: Colors.black,
          ),
          SizedBox(
            width: responsive.wp(2),
          ),
          Text(
            chat.name,
            style: TextStyle(
                fontSize: responsive.wp(4.2),
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          color: Colors.black,
        ),
        SizedBox(
          width: responsive.wp(3),
        )
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
