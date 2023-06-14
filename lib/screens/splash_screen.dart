import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:safe_driving_app/screens/onboarding_screen.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:AnimatedSplashScreen(

          duration: 3000,
          splash: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text('Save Drive',style:
                    TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),),
                    SizedBox(width: 10,),
                    Image(image: AssetImage('images/logo.png')),


                  ]
              ),
             //  //SizedBox(height: 10,),
             // Row(
             //   mainAxisAlignment: MainAxisAlignment.center,
             //   children: [
             //   LoadingAnimationWidget.staggeredDotsWave(
             //     color: Colors.white,
             //     size: 50,
             //   ),

              //SizedBox(height: 30,),
              // CircularProgressIndicator(
              //   color: Colors.white,
              // ),



          splashTransition: SplashTransition.rotationTransition,
         // pageTransitionType: PageTransitionType.bottomToTopJoined,
          backgroundColor: Colors.cyan,
          nextScreen:Onboarding() ,

        )

    );
  }
}

