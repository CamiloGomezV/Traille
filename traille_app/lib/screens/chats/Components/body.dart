import 'package:flutter/material.dart';
import 'package:traille_app/models/chat.dart';

import 'chat_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: ((context, index) => CharCard(
                  index: index,
                  chat: chatsData[index],
                  onpress: () {},
                )),
          ),
        ),
      ],
    );
  }
}
