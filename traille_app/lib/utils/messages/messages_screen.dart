import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:math' as math;

import 'package:traille_app/bloc/chat/chat_bloc.dart';
import 'package:traille_app/bloc/messages/massages_bloc.dart';
import 'package:traille_app/utils/bluetooth/bluetooth.dart';
import 'package:traille_app/utils/responsive/responsive.dart';
import 'package:traille_app/widgets/messages/message_widget.dart';

class MessagesScreen extends StatefulWidget {
  final Chat chat;
  const MessagesScreen({
    Key? key,
    required this.chat,
  }) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final BluetoothConn _bluetoothConn = BluetoothConn();
  late final BluetoothConnection connection;
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context: context);
    final TextEditingController commentController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: buildAppBar(responsive),
      body: Messages(),
      bottomNavigationBar: Container(
          padding: MediaQuery.of(context).viewInsets,
          color: Colors.white,
          child: TextField(
            minLines: 1,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            controller: commentController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  left: responsive.wp(8),
                  right: responsive.wp(10),
                  top: responsive.wp(5),
                  bottom: responsive.wp(5)),
              fillColor: Colors.grey[100],
              suffixIcon: ElevatedButton(
                  onPressed: () async {
                    String str = '';
                    print('bluetooth');
                    BluetoothConnection connection =
                        await BluetoothConnection.toAddress(
                            _bluetoothConn.connectedDevice?.address ?? '');
                    // connection = await BluetoothConnection.toAddress(_bluetoothConn.connectedDevice!.address);
                    setState(() {
                      List<int> list = utf8.encode(commentController.text);
                      Uint8List bytes = Uint8List.fromList(list);
                      connection.output.add(bytes);
                      demeMessages.add(ChatMessage(
                        text: commentController.text,
                        messageStatus: MessageStatus.viewed,
                        isSender: true,
                      ));});
                      // connection.input!.listen((deviceData) async {
                      //   str = ascii.decode(deviceData);
                      //   demeMessages.add(ChatMessage(
                      //   text: commentController.text,
                      //   messageStatus: MessageStatus.viewed,
                      //   isSender: false,
                      // ));
                      // });
                    // });
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: const CircleBorder(),
                      padding: EdgeInsets.all(responsive.wp(1)),
                      primary: const Color.fromARGB(120, 21, 191, 174)),
                  child: Transform.rotate(
                    angle: 330 * math.pi / 180,
                    child: Icon(Icons.send,
                        size: responsive.wp(7), color: Colors.white),
                  )),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(responsive.wp(10)),
                    topRight: Radius.circular(responsive.wp(10))),
              ),
              hintText: 'Escribe un mensaje',
            ),
          )),
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
            widget.chat.name,
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
