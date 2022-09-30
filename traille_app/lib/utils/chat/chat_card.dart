import 'package:flutter/material.dart';
import 'package:traille_app/bloc/chat/chat_bloc.dart';
import 'package:traille_app/utils/responsive/responsive.dart';

class ChatCard extends StatelessWidget {
  final int index;
  final Chat chat;
  final VoidCallback onpress;
  const ChatCard({
    Key? key,
    required this.index,
    required this.chat,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context: context);
    return InkWell(
      onTap: onpress,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsive.wp(5), vertical: responsive.hp(1.2)),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(21, 191, 174, 0.2),
                borderRadius: BorderRadius.all(Radius.circular(responsive.wp(4))),
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
                        height: responsive.wp(4),
                        width: responsive.hp(2),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                width: responsive.wp(0.7))),
                      ),
                    )
                  else
                    Positioned(
                      right: 0,
                      child: Container(
                        height: responsive.wp(4),
                        width: responsive.hp(2),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                width: responsive.wp(0.7))),
                      ),
                    )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: responsive.wp(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.name,
                      style: TextStyle(
                          fontSize: responsive.wp(3.8), fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: responsive.wp(1.5),
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
