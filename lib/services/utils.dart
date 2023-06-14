import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_driving_app/services/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class Utils{
  BuildContext context;
  Utils(this.context);
  bool get getTheme=>Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get color=>getTheme? Colors.white:Colors.black;
  Size get getScreenSize=>MediaQuery.of(context).size;
}