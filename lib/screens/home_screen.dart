import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:safe_driving_app/services/http_service.dart';

import '../widgets/button.dart';
class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  HomePage(this.cameras);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// flag to stop the timer while fetching the exist face details results (JSON)
  int f = 1;
  /// Counting until capture a photo
  static int cCounter=2;
  int counter=cCounter;
   late Timer timer;
   late File img;
  Future<void>?_initializeControllerFuture;
  late CameraController cameraController;
  final score=0;
  HttpService httpService=HttpService();
///////////////////////////////////////////////////////////////////////
  void takePhoto()async{
    try{
      //f=0;
     await _initializeControllerFuture;
     XFile image=await cameraController.takePicture();
     print('image.path');
     print(image.path);
     img=File(image.path);
      httpService.uploading(img);
      //if (score>=10){FlutterRingtonePlayer.play(fromAsset: 'assets/warning-alarm.wav');}


    }catch(e){
      print(e);
    }
  }
  void startTimer(){
    const oneSec= Duration(seconds: 2);
    timer=Timer.periodic(oneSec, (Timer timer) {
     // if(f==1){
        //if(counter==0){
          setState(() {
            takePhoto();
            print('photoooooooooooooooooooooooo');
            //counter=cCounter;
          });

        // }else{
        //   setState(() {
        //     counter--;
        //   });
        // }

    //  }
    });
  }
  @override
  void initState() {
    super.initState();
    cameraController =
        CameraController(widget.cameras[1], ResolutionPreset.high);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        startTimer();
      });
      print('helloooooooooo');
      // startTimer();
      print('amal');
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('user denied');
            break;
          default:
            print('handel error');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Container(
          height: 800,
          //padding: EdgeInsets.only(top: 10),
          child: CameraPreview(cameraController),
        ),
        Container(
          padding: EdgeInsets.only(top: 100),
          child: CustomButton(
            text: 'Start',
            onTap: () {
              //CameraPreview(cameraController);
              //FlutterRingtonePlayer.play(fromAsset: 'assets/warning-alarm.wav');
              // alarms.map((alarm) {
              //   String id = alarm.id;
              //   switch (id) {
              //     case '1':
              //       {
              //         alarm.sound;
              //       }
              //       break;
              //     case '2':
              //       {
              //         alarm.sound;
              //       }
              //       break;
              //     default:
              //       {
              //         alarm.sound;
              //       }
              //       break;
              //   }
              //   return FlutterRingtonePlayer.play(
              //     looping: true,
              //     asAlarm: false,
              //     fromAsset: alarm.id == '1'
              //         ? alarm.sound
              //         : alarm.id == '2'
              //             ? alarm.sound
              //             : alarm.id == '3'
              //                 ? alarm.sound
              //                 : null,
              //
              //     //(alarm.id=='2')?alarm.sound:null,
              //   );
              // }).toList();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 550),
          child: Container(
            child: CustomButton(
              onTap: () {
                FlutterRingtonePlayer.stop();
               //  Navigator.of(context).push(
               //    MaterialPageRoute(
               //      builder: (context) => DisplayPictureScreen(
               //        // Pass the automatically generated path to
               //        // the DisplayPictureScreen widget.
               //        imagePath: image,
               //      ),
               //    ),
               //  );
              },
              text: 'Stop Alarm',
            ),
          ),
        )
      ],
    ));
  }
}
