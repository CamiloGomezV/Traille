import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialRoutePage extends StatefulWidget {
  const InitialRoutePage({Key? key}) : super(key: key);

  @override
  InitialPageState createState() => InitialPageState();
}

class InitialPageState extends State<InitialRoutePage> with AfterLayoutMixin<InitialRoutePage> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);
    if (seen) {
      Navigator.pushReplacementNamed(context, '/homepage');
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushReplacementNamed(context, '/intropage');
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

