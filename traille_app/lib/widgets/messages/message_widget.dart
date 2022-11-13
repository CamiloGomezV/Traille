import 'package:flutter/material.dart';
import 'package:traille_app/bloc/messages/massages_bloc.dart';
import 'package:traille_app/utils/responsive/responsive.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context: context);
    return Column(children: [
      SizedBox(
        height: responsive.hp(2),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.hp(1)),
          child: ListView.builder(
            itemCount: demeMessages.length,
            itemBuilder: ((context, index) => Message(
                  responsive: responsive,
                  message: demeMessages[index],
                )),
          ),
        ),
      ),
    ]);
  }
}

class Message extends StatelessWidget {
  final ChatMessage message;
  final Responsive responsive;
  const Message({Key? key, required this.message, required this.responsive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        TextMessage(
          responsive: responsive,
          message: message,
        ),
      ],
    );
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.responsive,
    required this.message,
  }) : super(key: key);

  final Responsive responsive;
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 7),
        padding: EdgeInsets.symmetric(
            horizontal: responsive.wp(6), vertical: responsive.hp(1.5)),
        decoration: BoxDecoration(
            color: message.isSender
                ? const Color.fromARGB(120, 21, 191, 174)
                : Colors.grey.shade300,
            borderRadius: message.isSender
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))
                : const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
        child: Text(message.text));
  }
}
