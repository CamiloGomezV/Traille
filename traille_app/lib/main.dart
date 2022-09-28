import 'package:flutter/material.dart';
import 'package:traille_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static MaterialColor colorApp = MaterialColor(
    const Color.fromRGBO(21, 191, 174, 1).value,
    const <int, Color>{
      50: Color.fromRGBO(21, 191, 174, 0.1),
      100: Color.fromRGBO(21, 191, 174, 0.2),
      200: Color.fromRGBO(21, 191, 174, 0.3),
      300: Color.fromRGBO(21, 191, 174, 0.4),
      400: Color.fromRGBO(21, 191, 174, 0.5),
      500: Color.fromRGBO(21, 191, 174, 0.6),
      600: Color.fromRGBO(21, 191, 174, 0.7),
      700: Color.fromRGBO(21, 191, 174, 0.8),
      800: Color.fromRGBO(21, 191, 174, 0.9),
      900: Color.fromRGBO(21, 191, 174, 1),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarille',
      theme: ThemeData(
        primarySwatch: colorApp,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
