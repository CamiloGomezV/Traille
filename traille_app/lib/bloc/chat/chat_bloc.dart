class Chat {
  final String name, lastMessage, time;
  final bool isActive;

  Chat({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.isActive,
  });
}

List chatsData = [
  Chat(
      name: "Dispositivo 0",
      lastMessage: "Hola, como  vas con el trabajo",
      time: "3m ago",
      isActive: false),
  Chat(
      name: "Dispositivo 1",
      lastMessage: "Dale, yo te aviso",
      time: "10m ago",
      isActive: true),
];
