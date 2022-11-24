import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traille_app/ui/pages/appearance/theme_provider.dart';
import 'package:traille_app/ui/pages/appearance/changeThemeButton.dart';

class appearance extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
    return Scaffold(
      appBar: AppBar(
        iconTheme:  Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Cambiar apariencia', style: TextStyle(color: Theme.of(context).iconTheme.color),),
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Center(
        child: Text(
          '$text!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

