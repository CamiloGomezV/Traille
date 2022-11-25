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
  Chat(
      name: "Dispositivo 0",
      lastMessage: "Hola, como  vas con el trabajo",
      time: "3m ago",
      isActive: false,
      chatMessages: []),
  Chat(
      name: "Dispositivo 1",
      lastMessage: "Dale, yo te aviso",
      time: "10m ago",
      isActive: true,
      chatMessages: []),
];
