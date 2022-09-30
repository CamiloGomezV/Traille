import 'package:flutter/material.dart';
import 'package:traille_app/ui/pages/chat/chat_view.dart';
import 'package:traille_app/ui/pages/settings/settings_view.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final List<Widget> _pages = [
    const ChatsView(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          currentIndex: _currentPage,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.whatsapp_outlined),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: 'Menu'),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ));
  }
}
