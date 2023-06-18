import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/dark_theme_provider.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({this.title, this.subtitle});

  String? title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    final themeState=Provider.of<DarkThemeProvider>(context);
    final Color color=themeState.getDarkTheme ? Colors.white:Colors.black;
    return ListTile(
      title: Text(
        title!,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue[900]),
      ),
      subtitle: Container(
        padding: EdgeInsets.only(left: 22,top: 8),
          child: Text(
        subtitle!,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20, color: color),
      )),
    );
  }
}
