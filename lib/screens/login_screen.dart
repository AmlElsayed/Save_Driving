import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving_app/screens/signup_screen.dart';
import 'package:safe_driving_app/services/http_service.dart';

import '../services/dark_theme_provider.dart';
import '../widgets/button.dart';
import '../widgets/container_clipper.dart';
import '../widgets/text_field.dart';
import 'Navigat_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  String id = 'LoginPage';
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    final themeState=Provider.of<DarkThemeProvider>(context);
    final Color color=themeState.getDarkTheme ? Colors.white:Colors.black;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
         ListView(

           children: [
             Padding(
               padding: EdgeInsets.only(top: 365),
               child: ClipPath(
                 clipper: ContainerClipper(),
                 child: Container(
                   //padding: EdgeInsets.only(left: 150,right: 100),
                   height: 365,
                   color: Colors.blue,
                 ),
               ),
             ),
           ],
         ),
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 450),
                child: Image(image: AssetImage('images/image 2.png')),
              ),

            ],
          ),
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 700, left: 50),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account ?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context,SignupPage().id);
                        },
                        child: Text(
                          '  Sign Up',
                          style: TextStyle(
                              color: Color(0xffC7EDE6),
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Save Drive',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image(image: AssetImage('images/logo.png')),
                        ]),
                  ),
                  SizedBox(
                    height: 80,
                  ),Padding(padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Email',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: color),
                  ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomFormTextField(
                    onChanged: (data){
                      email=data;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Password',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: color),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomFormTextField(
                    onChanged: (data){
                      password=data;

                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onTap: ()async {
                     // await HttpService.login(email, password, context);
                      Navigator.pushReplacementNamed(context,NavigationBarPage().id);
                    },
                    text: 'Login',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
