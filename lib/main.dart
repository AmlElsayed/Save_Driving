//import 'dart:js';

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving_app/screens/Navigat_page.dart';
import 'package:safe_driving_app/screens/login_screen.dart';
import 'package:safe_driving_app/screens/onboarding_screen.dart';
import 'package:safe_driving_app/screens/signup_screen.dart';
import 'package:safe_driving_app/screens/splash_screen.dart';
import 'package:safe_driving_app/services/dark_theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'firebase_options.dart';
late final List<CameraDescription> cameras;
Future<void>  main()async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras= await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(),

  );
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 DarkThemeProvider themeChangeProvider = DarkThemeProvider();
 void getCurrentAppTheme()async{
   themeChangeProvider.setDarkTheme=await themeChangeProvider.darkThemePrefs.getTheme();
 }
 @override
 void initState(){
   getCurrentAppTheme();
   super.initState();
 }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_){
            return themeChangeProvider;
          })
        ],
       child: Consumer<DarkThemeProvider>(builder: (context, themeProvider,child) {

            return MaterialApp(
              theme: Styles.themeData(themeProvider.getDarkTheme,context),
              debugShowCheckedModeBanner: false,
              initialRoute: 'Splash',
              routes: {
                'Splash': (context) => Splash(),
                'Onboarding': (context) => Onboarding(),
                LoginPage().id: (context) => LoginPage(),
                SignupPage().id: (context) => SignupPage(),
                NavigationBarPage().id: (context) => NavigationBarPage(),


              },
            );
          }

       )
        );
  }
  }






