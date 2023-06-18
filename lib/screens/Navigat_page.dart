import 'package:provider/provider.dart';
import 'package:safe_driving_app/main.dart';
import 'package:safe_driving_app/models/profile_data.dart';
import 'package:safe_driving_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:safe_driving_app/screens/map_screen1.dart';
import 'package:safe_driving_app/screens/profile_page.dart';

import '../services/dark_theme_provider.dart';
import 'history_screen.dart';
class NavigationBarPage extends StatefulWidget {
  ProfileModel profileModel;
  NavigationBarPage( {required this.profileModel}) ;
  String id='NavigationBarPage';

  @override
  State<NavigationBarPage> createState() => _NavigationBarPage(profileModel);
}

class _NavigationBarPage extends State<NavigationBarPage> {
  ProfileModel profileModel;
_NavigationBarPage(this.profileModel);
  // late List<dynamic> _recognition;
  // int _imageHeight=0;
  // int _imageWidth=0;
  int _selectedIndex=0;

  // setRecognitions(recognition,imageHeight,imageWidth){
  //   setState(() {
  //     _recognition=recognition;
  //     _imageHeight=imageHeight;
  //     _imageWidth=imageWidth;
  //   });
  // }
  // void onTapItem(int index){
  //   setState(() {
  //     _selectedIndex=index;
  //   });
  // }
   List<Widget>_pages()=>[

    MapPage(profileModel: widget.profileModel,),
     HomePage(cameras,),
    HistoryPage(profileModel: widget.profileModel),
  ProfilePage(profileModel: widget.profileModel),
  ];
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.blueGrey:Colors.white;
    final List<Widget>page=_pages();
    return Scaffold(
      body:page[_selectedIndex],
      // Container(
      //  child: _pages.elementAt(_selectedIndex),
      // ),
      bottomNavigationBar:
      NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected:(_selectedIndex)=>setState(()=>this._selectedIndex=_selectedIndex ),

        height: 60,
        backgroundColor: color,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.map_outlined,color: Colors.black38,) ,
             label: 'location',
            selectedIcon: Icon(Icons.map,color: Colors.indigo,),
          ),
          NavigationDestination(
            icon: Icon(Icons.home_outlined,color: Colors.black38,
            ) ,
            selectedIcon: Icon(Icons.home,color: Colors.indigo,),
            label: 'home',),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined,color: Colors.black38,) ,
            selectedIcon: Icon(Icons.calendar_month,color: Colors.indigo,),
            label: 'history',),
          NavigationDestination(icon: Icon(Icons.perm_identity_rounded,color: Colors.black38,) ,
            selectedIcon: Icon(Icons.perm_identity,color: Colors.indigo,),
            label: 'profile',)
        ],
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   //elevation: 0,
      //   items: const<BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //      icon: Icon(Icons.home,color: Colors.black38,) ,
      //       label: 'Calls',
      //     ),
      //     BottomNavigationBarItem(
      //      icon: Icon(Icons.location_city,color: Colors.black38,) ,
      //       label: 'Calls',
      //     ),
      //     BottomNavigationBarItem(
      //      icon: Icon(Icons.calendar_month,color: Colors.black38,) ,
      //       label: 'Calls',
      //     ),
      //     BottomNavigationBarItem(
      //      icon: Icon(Icons.perm_identity_rounded,color: Colors.black38) ,
      //       label: 'Calls',
      //     ),
      //
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap:onTapItem ,
      //   type: BottomNavigationBarType.shifting,
      //   selectedFontSize: 20,
      //   selectedIconTheme: IconThemeData(color: Colors.blue,size: 50),
      //   showSelectedLabels: false,
      //
      // ),
    );
  }
}
