import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:safe_driving_app/screens/onboarding_screen.dart';
class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    Onboarding()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: 'logo/splash.png',
        nextScreen: Onboarding(),
        splashTransition: SplashTransition.rotationTransition
    );
  }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//
//               colors: [Color(0xFFFF800B),Color(0xFFCE1010),]
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Column(
//               children: [
//                 Image.asset(
//                   "images/logo.png",
//                   height: 300.0,
//                   width: 300.0,
//                 ),
//                 Text("A whole grocery store\n at your fingertips",textAlign:TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18.0,
//                   ),
//                 ),
//               ],
//             ),
//
//             CircularProgressIndicator(
//               valueColor:  AlwaysStoppedAnimation<Color>(Colors.orange),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
 }