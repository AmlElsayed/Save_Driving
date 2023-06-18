import 'package:flutter/material.dart';
import 'package:safe_driving_app/models/history.dart';

const String googleAPIKey = "AIzaSyBzOAZJ_li6XyrEgZ1ue8Vz5wLta1nJDes";

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: isDarkTheme ? const Color(0xFF000010) : const Color(0xFFFFFFFF),
        primaryColor: Colors.indigo,
        colorScheme:
          ThemeData().colorScheme.copyWith(
            //secondary:isDarkTheme ? const Color(0xFF1a1f3c) : const Color(0xFFFFFFFF),
            brightness:isDarkTheme?Brightness.dark:Brightness.light,
          ),
      buttonTheme:Theme.of(context).buttonTheme.copyWith(
        colorScheme: isDarkTheme?const ColorScheme.dark():const ColorScheme.light()
      )

    );
  }
}
TripModel? tripModel;
class ApiConst{
  static String baseUrl='https://gp-zx0p.onrender.com';
  static String login='/driver-login';
  static String register='/driver-signup';
  //static String model='/${tripModel.}';
}

