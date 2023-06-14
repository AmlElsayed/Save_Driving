import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving_app/screens/login_screen.dart';
import 'package:safe_driving_app/services/http_service.dart';
import 'package:safe_driving_app/services/dark_theme_provider.dart';
import 'package:safe_driving_app/widgets/list_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../main.dart';
import '../models/profile_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  });

//final Alarm alarm;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double _currentvalue = 20;
  String? _selected;
  PickedFile? _imagefile;
  final ImagePicker picker = ImagePicker();
  // List<Alarm> _dropdownItems = [
  //   Alarm('1', "GeeksforGeeks"),
  //   Alarm('2', "Javatpoint"),
  //   Alarm('3', "tutorialandexample"),
  //   Alarm('4', "guru99")
  // ];
  // List<DropdownMenuItem<Alarm>> _dropdownMenuItems;
  // List<DropdownMenuItem<Alarm>> buildDropDownMenuItems(List listItems) {
  //   List<DropdownMenuItem<Alarm>> items = [];
  //   for (Alarm listItem in listItems) {
  //     items.add(
  //       DropdownMenuItem(
  //         child: Text(listItem.name),
  //         value: listItem,
  //       ),
  //     );
  //   }
  //   return items;
  // }

  // List<Map> _myOudio = [
  //   {
  //     'id': '1',
  //     'name': 'classic_alarm',
  //     'asset':'assets/classic-alarm.wav',
  //   },
  //   {
  //     'id': '2',
  //     'name': 'abeer',
  //   },
  //   {
  //     'id': '3',
  //     'name': 'amola',
  //   }
  // ];

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, LoginPage().id);
  }

  late ProfileModel _profileModel;
  //final HttpService httpService=HttpService();
  // void _getData()async{
  //   //_profileModel=(await HttpService.getData()!)as Future<ProfileModel> ;
  //   _profileModel.getData();}
  @override
  void initState(){
    super.initState();
    _profileModel=HttpService.getData() as ProfileModel;
    //_profileModel=HttpService.getData();
    // getData().then(profile){
    //   setState(() {
    //     profileModel = profile;
    //   });
    // };
   // _getData();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black38;
    return SafeArea(
        child: ListView(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Save Drive',
                  style: TextStyle(
                      fontSize: 26,
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
              height: 10,
            ),

            Container(
              //padding: EdgeInsets.only(left: 15,top: 20,right: 15),
              // child: GestureDetector(
              //   onTap:
              //       () {
              //     FocusScope.of(context).unfocus();
              //     // imagePackerOption;
              //   },
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 25,
                              blurRadius: 10,
                              color: Colors.indigo.withOpacity(0.1),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: _imagefile == null
                                  ? AssetImage('images/profile.jpeg')as ImageProvider
                                  : FileImage(File(_imagefile!.path),
                              )
                          )
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.blue,
                            ),
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) => bottomsheet()));
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )))
                  ],
                ),
              ),
              // ),
            ),

            ///rating//////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(_profileModel.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue[900])),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_rate,
                          color: Colors.yellowAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '9.5',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.lightBlue[200],
                      ),
                      child: CustomListTile(
                        title: 'RisedCompleted',
                        subtitle: _profileModel.rideCompleted.toString(),
                      ))),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.lightBlue[200],
                      ),
                      child: CustomListTile(
                        title: 'DistanceCovered',
                        subtitle: _profileModel.totalDistance.toString(),
                      )))
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              CustomListTile(
                title: 'Phone',
                subtitle: _profileModel.phone,
              ),
              CustomListTile(
                title: 'Email',
                subtitle: _profileModel.email,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: color),
              borderRadius: BorderRadius.circular(10)),
          //color: Colors.lightBlue,
          //padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Settings',
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: Text('Dark Mode',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  Switch(
                    value: themeState.getDarkTheme,
                    onChanged: (value) {
                      setState(() {
                        themeState.setDarkTheme = value;
                      });
                    },
                    activeColor: Colors.blue[900],
                  )
                ],
              ),
              // Row(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(left: 20),
              //       child: Text('Sound',
              //           style: TextStyle(
              //               fontSize: 15, fontWeight: FontWeight.bold)),
              //     ),
              //     SizedBox(
              //       width: 55,
              //     ),
              //     // Container(
              //     //   height: 30,
              //     //   decoration: BoxDecoration(
              //     //       border: Border.all(width: 2, color: color),
              //     //       borderRadius: BorderRadius.circular(10)),
              //     //   child: DropdownButtonHideUnderline(
              //     //       child: ButtonTheme(
              //     //     alignedDropdown: true,
              //     //     child: DropdownButton(
              //     //       hint: Text('select'),
              //     //       value: _selected,
              //     //       onChanged: (newValue) {
              //     //         setState(() {
              //     //           _selected = newValue as String?;
              //     //         });
              //     //       },
              //     //       items: alarms.map((alarm) {
              //     //         return DropdownMenuItem(
              //     //           value: alarm.id,
              //     //           child: Text(alarm.name),
              //     //         );
              //     //       }).toList(),
              //     //       // _dropdownItems.map((String dropdownItems) {
              //     //       //   return DropdownMenuItem(
              //     //       //       value: bankItem[]
              //     //       //       child: Text(bankItem['name']));
              //     //       // }).toList(),
              //     //     ),
              //     //   )),
              //     // )
              //   ],
              // ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Logout',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 10),
                    child: InkWell(
                      onTap: () {
                        _logout(context);
                      },
                      child: Icon(
                        Icons.logout,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  )
                ],
              )
              // Row(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(left: 20),
              //       child: Text('Volume',
              //           style: TextStyle(
              //               fontSize: 15, fontWeight: FontWeight.bold)),
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     Slider(
              //         value: _currentvalue,
              //         //alarm.volume,
              //         min: 0,
              //         max: 100,
              //         inactiveColor: Colors.grey,
              //         activeColor: Colors.blue[900],
              //         thumbColor: Colors.white,
              //         onChanged: //(value)=>this.alarm.volume=value,
              //             (double valuee) {
              //           setState(() {
              //             _currentvalue = valuee;
              //           });
              //         })
              //   ],
              // )
            ],
          ),
        )
      ],
    ));
  }

  Widget bottomsheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  takephoto(ImageSource.camera);
                },
                child: Row(
                  children: [
                    Icon(Icons.camera),
                    SizedBox(
                      width: 5,
                    ),
                    Text('camera')
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  takephoto(ImageSource.gallery);
                },
                child: Row(
                  children: [
                    Icon(Icons.image),
                    SizedBox(
                      width: 5,
                    ),
                    Text('gallery')
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void takephoto(ImageSource source) async {
    final pickedfile = await picker.getImage(source: source);
    setState(() {
      _imagefile = pickedfile;
    });
    HttpService.uploadProfileImage(_imagefile as File );
   // Get.back();
  }
}
