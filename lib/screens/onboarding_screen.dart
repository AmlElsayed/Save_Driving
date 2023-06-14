import 'package:flutter/material.dart';
import 'package:safe_driving_app/intro_screen/page1.dart';
import 'package:safe_driving_app/intro_screen/page2.dart';
import 'package:safe_driving_app/intro_screen/page3.dart';
import 'package:safe_driving_app/screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  Onboarding({Key? key}) : super(key: key);
  String id = 'Onboarding';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  ///controller to keep track of which page we are on
  PageController _controller = PageController();

  /// keep track of if we are on the last page or not
  bool onlastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onlastpage = (index == 2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginPage().id);
                  },
                  child: Text('Skip',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                ),
                SmoothPageIndicator(
                  effect: SlideEffect(
                    dotHeight: 6,
                    activeDotColor: Colors.blue

                  ),
                  controller: _controller,
                  count: 3,
                ),
                onlastpage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginPage().id);
                        },
                        child: Text('Done',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text('Next',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                      )
              ],
            ))
      ],
    )
    );
  }
}
