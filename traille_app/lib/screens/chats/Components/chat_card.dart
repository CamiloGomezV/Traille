import 'package:flutter/material.dart';

import '../../../models/chat.dart';

class CharCard extends StatelessWidget {
  final int index;
  final Chat chat;
  final VoidCallback onpress;
  const CharCard({
    Key? key,
    required this.index,
    required this.chat,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(21, 191, 174, 0.2),
                borderRadius: BorderRadius.all(Radius.circular(17)),
              ),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromRGBO(21, 191, 174, 0.0),
                    child: Text("D$index"),
                  ),
                  if (chat.isActive)
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                width: 3)),
                      ),
                    )
                  else
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                width: 3)),
                      ),
                    )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.name,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        chat.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(opacity: 0.7, child: Text(chat.time)),
          ],
        ),
      ),
    );
  }
}
