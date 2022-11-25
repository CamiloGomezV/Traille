import 'package:flutter/material.dart';

enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final String text;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    required this.text,
    required this.messageStatus,
    required this.isSender,
  });
}

List demeMessages = [
];
