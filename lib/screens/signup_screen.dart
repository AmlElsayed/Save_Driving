import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving_app/screens/login_screen.dart';
import 'package:safe_driving_app/services/http_service.dart';

import '../services/dark_theme_provider.dart';
import '../widgets/button.dart';
import '../widgets/container_clipper.dart';
import '../widgets/text_field.dart';
import 'Navigat_page.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);
  String id = 'SignupPage';
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {


  String? email;
  String? password;
  String? firstname;
  String? lastname;
  String? username;
  String? instituteId;

  GlobalKey<FormState> formkey = GlobalKey();
  bool onloading = false;
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  TextEditingController _firstnameEditingController = TextEditingController();
  TextEditingController _lastnameEditingController = TextEditingController();
  TextEditingController _usernameEditingController = TextEditingController();
  TextEditingController _instituteEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return ModalProgressHUD(
      inAsyncCall: onloading,
      child: SafeArea(
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
                        'Already have an account ?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, LoginPage().id);
                          },
                          child: Text(
                            '  Login',
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
                key: formkey,
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 7),
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
                      height: 11,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'FirstName',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: color),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomFormTextField(
                      onController: _firstnameEditingController,
                      onChanged: (data) {
                        firstname = data;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'LastName',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: color),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomFormTextField(
                      onController: _lastnameEditingController,
                      onChanged: (data) {
                        lastname = data;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'UserName',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: color),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomFormTextField(
                      onController: _usernameEditingController,
                      onChanged: (data) {
                        username = data;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'InstituteID',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: color),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomFormTextField(
                      onController: _instituteEditingController,
                      onChanged: (data) {
                        instituteId = data   ;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: color),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomFormTextField(
                      onController: _emailEditingController,
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: color),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomFormTextField(
                      onController: _passwordEditingController,
                      onChanged: (data) {
                        password = data;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomButton(
                      onTap: () async {
                        ///validation
                        if (formkey.currentState!.validate()) {
                          onloading = true;
                          setState(() {});
                          try {
                            await HttpService.register(
                                _emailEditingController.text,
                                _passwordEditingController.text,
                                _lastnameEditingController.text,
                                _firstnameEditingController.text,
                                _usernameEditingController.text,
                                _instituteEditingController.text,
                                context);
                          //  Navigator.pushNamed(context, NavigationBarPage().id);
                          } catch (ex) {
                            print(ex);
                            print('errorrrrrr');
                          }
                          onloading = false;
                          setState(() {});
                        }
                        //await HttpService.register(email, password, lastname,firstname,username,instituteId, context);

                        ///firebase/////////////////////////////
                        //  var auth= FirebaseAuth.instance;
                        // UserCredential user= await auth.createUserWithEmailAndPassword(email: email!, password: password!);
                        //Navigator.pushNamed(context, NavigationBarPage().id);
                      },
                      text: 'Sign Up',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
