import 'package:traille_app/bloc/messages/massages_bloc.dart';

class Chat {
  final String name, lastMessage, time;
  final bool isActive;
  final List<ChatMessage> chatMessages;

  Chat({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.isActive,
    required this.chatMessages,
  });
}

List chatsData = [
];
