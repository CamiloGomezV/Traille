import 'package:flutter/material.dart';
import 'package:traille_app/Notification/local_notification.dart';

class notification2 extends StatefulWidget {
  const notification2({Key? key}) : super(key: key);

  @override
  State<notification2> createState() => _notification2();
}

class _notification2 extends State<notification2> {
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
              height: 300,
              width:300, 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Aquí puedes activar las noticaciones.',
                    style: TextStyle(fontSize: 20),
                  ),
                  
                  ElevatedButton(
                    onPressed: () async {
                      await service.showScheduledNotification(
                        id: 0,
                        title: 'Notificaciones Traille',
                        body: 'Listo para traducir a braile',
                        seconds: 8,
                      );
                    },
                    child: const Text('Encender notificationes',),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, //background color of button
                      side: BorderSide(width:2, color:Colors.grey), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(16)
                      ),
                    )
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  
  }