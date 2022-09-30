import 'package:flutter/material.dart';
import 'package:traille_app/ui/pages/bluetooth/bluetooth_view.dart';
import 'package:traille_app/ui/pages/home/home_page.dart';
import 'package:traille_app/ui/pages/intro_screen/intro_view.dart';

// Views

Map<String, WidgetBuilder> getRoutes() => {
      '/intropage': (BuildContext context) => const IntroductionPage(),
      '/bluetooth': (BuildContext context) => const BluetoothView(),
      '/homepage': (BuildContext context) => const HomePage(),
    };