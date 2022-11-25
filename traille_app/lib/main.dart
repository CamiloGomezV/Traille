import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traille_app/routes/routes.dart';
import 'package:traille_app/ui/pages/appearance/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _){
      final themeProvider = Provider.of<ThemeProvider>(context);
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Traille',
          themeMode: themeProvider.themeMode,
          theme: Mythemes.lightTheme,
          darkTheme: Mythemes.darkTheme,
          initialRoute: '/initialroute',
          routes: getRoutes());
    },
  );
}