import 'package:flutter/material.dart';
import 'package:traille_app/bloc/chat/chat_bloc.dart';
import 'package:traille_app/utils/chat/chat_card.dart';
import 'package:traille_app/utils/messages/messages_screen.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: ((context, index) => ChatCard(
                  index: index,
                  chat: chatsData[index],
                  onpress: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessagesScreen(
                          chat: chatsData[index],
                        ),
                      )),
                )),
          ),
        ),
      ],
    );
  }
}
