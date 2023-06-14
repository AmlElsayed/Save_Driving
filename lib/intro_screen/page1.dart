import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Stack(children: [
          Container(
            child: Image(
              image: AssetImage('images/onboarding1.png'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 80),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Save Drive',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              Image(image: AssetImage('images/logo.png')),
            ]),
          ),
          Center(
            child: Container(
                padding: EdgeInsets.only(
                    top: 450,
                    left: 30
                ),
                //width: 180,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Drive your car safely',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),

                    Text(
                      'if you make a mistake you will be warned automatically and quickly',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18),
                    ),




                  ],
                )),
          )
        ]),

    );
  }
}
