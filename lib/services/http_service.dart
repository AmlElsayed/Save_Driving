import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:http/http.dart' as http;
import 'package:safe_driving_app/constants.dart';
import 'package:safe_driving_app/models/history.dart';
import 'package:safe_driving_app/models/profile_data.dart';
import 'package:path_provider/path_provider.dart';

import '../screens/Navigat_page.dart';

class HttpService {
  static final _client = http.Client();
  static var _loginUrl = Uri.parse(ApiConst.baseUrl + ApiConst.login);
  static var _registerUrl = Uri.parse(ApiConst.baseUrl + ApiConst.register);
  static var _uploadUrl = Uri.parse(ApiConst.baseUrl + ApiConst.register);
  static var _uploadProfileUrl =
      Uri.parse(ApiConst.baseUrl + ApiConst.register);
  static TripModel? tripModel;
  //Future<void>
  static login( username, password, context) async {
    var body= {"username": username, "password": password};
    http.Response response = await _client
        .post(_loginUrl,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: json.encode(body),);
    print(_loginUrl);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var json = jsonDecode(response.body);
      await EasyLoading.showSuccess('success');
      ProfileModel profileModel=ProfileModel.fromJson(json['driver']);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavigationBarPage(profileModel: profileModel,)));
    //   if (json["message"] == 'Driver logged in successfully') {
    //     await EasyLoading.showSuccess(json['message']);
    //     await Navigator.pushNamed(context, NavigationBarPage().id);
    //   } else {
    //     await EasyLoading.showError(json['message']);
    //   }
    // } else {
    //   await EasyLoading.showError(
    //       "Error Code : ${response.statusCode.toString()}");
      }else{
      await EasyLoading.showError(
                 "Error Code : ${response.statusCode.toString()}");
    }
  }

  static Future<void> register(String email, String password, String lastname,String firstname,String username,String instituteId, context) async {
    var body={"firstname": firstname,'lastname':lastname,'username':username,'institute_id':instituteId, "email": email, "password": password,};
    http.Response response = await _client.post(_registerUrl,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
        body:json.encode(body) );
    if (response.statusCode == 200) {
      final responsebody = jsonDecode(response.body);

    await EasyLoading.showSuccess('success');
      ProfileModel profileModel=ProfileModel.fromJson(responsebody['driver']);
      print(responsebody['driver']);
      print(profileModel.id);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavigationBarPage(profileModel: profileModel,)));

     }else {
        await EasyLoading.showError(
             "Error Code : ${response.statusCode.toString()}");}
  }
  List<TripModel> model=[];
  Future<List<TripModel>?> tripDetails(id) async {
    Uri _tipDetail = Uri.parse(ApiConst.baseUrl + '/driver-trips/${id}');
    http.Response response = await _client.get(_tipDetail);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(jsonDecode(response.body)["trips"]);
      for(var trip in jsonDecode(response.body)["trips"]){
        model.add(TripModel.fromJson(trip));
      }

      return model;
    }
    return null;
  }

   static Future<void> postTripDetails(Startlocation,endlocation,distance,id) async {

var body={

     "start_loc": Startlocation,
     "destination": endlocation,
     "distance": distance

     };
    Uri _postTipDetail = Uri.parse(ApiConst.baseUrl +'/start_new_trip/${id}');
    var response =
        await _client.post(_postTipDetail,headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }, body: jsonEncode(body));
    //return response;
    print(_postTipDetail);
    print(response.statusCode);
    print(response.request);
    //print(jsonDecode(response.body)["message"]);
    print(id);

     if (response.statusCode==200){

        tripModel=TripModel.fromJson(jsonDecode(response.body)['trip']);
        print(tripModel!.id);
   print('success');
       await EasyLoading.showSuccess('Trip details added successfully');
       //String model=userModelToJson();
       //return model;

     }else{
       print('error');
     }

  }
//TripModel? tripModel;
  Future<void> uploading(File image)async{
        Uint8List imageBytes = await image.readAsBytes(); //convert to bytes
    String base64image =
        base64Encode(imageBytes);
    print(base64image);
        uploadImage(base64image);
  }
  Future<void> uploadImage(String base64Image) async {
    final url = 'https://gp-zx0p.onrender.com/${tripModel!.id}';
    final headers = {'Content-Type': 'multipart/form-data'};
    final multipartFile = await getMultipartFileFromBase64(base64Image);
    final request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers.addAll(headers)
      ..files.add(multipartFile);
    final response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Error uploading image');
    }
  }

  Future<http.MultipartFile> getMultipartFileFromBase64(String base64Image) async {
    final decodedImage = base64Decode(base64Image);
    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/temp.jpg';
    final imageFile = await File(tempPath).writeAsBytes(decodedImage);
    final stream = http.ByteStream(imageFile.openRead());
    final length = await imageFile.length();
    final multipartFile = http.MultipartFile('image', stream, length,
        filename: imageFile.path.split('/').last);
    return multipartFile;
  }
//    Future<http.Response> uploadImage(File image) async {
//     var score=0;
//     print(tripModel!.id);
//     String filename = image.path.split('/').last;
//     final request = http.MultipartRequest('POST', Uri.parse('https://gp-zx0p.onrender.com/${tripModel!.id}'));
//     print('id');
//
//     //final headers = {'Content-type': 'multipart/from-data'};
//     Uint8List imageBytes = await image.readAsBytes(); //convert to bytes
//     String base64image =
//         base64Encode(imageBytes);
//     print('basimageeeeeeeee');
//     print(base64image);//convert bytes to base64 string
//     ///For sending files/images/videos
//     request.files.add(await http.MultipartFile.fromPath('image', base64image,filename: filename)
//         // request.files.add(http.MultipartFile('image',image.readAsBytes().asStream(),image.lengthSync(),filename: filename),
//         );
//     //request.headers.addAll(headers);
//
//     ///to complete the multipartrequest
//     var res = await request.send();
//     print(res.statusCode);
//     var response = await http.Response.fromStream(res);
//     final result=json.decode(response.body)as Map<String,dynamic>;
//     if(result["iswake"]==true){
//       score=0;
//     }else{
//       score+=1;
//     }
//     if(score>=5){
//       FlutterRingtonePlayer.play(fromAsset: 'assets/warning-alarm.wav');
//     }
//     return response;
//   }

  static Future<http.Response> uploadProfileImage(File image) async {
    String filename = image.path.split('/').last;
    final request = http.MultipartRequest('POST', _uploadProfileUrl);
    final headers = {'Content-type': 'multipart/from-data'};
    Uint8List imageBytes = await image.readAsBytes();
    String base64image = base64Encode(imageBytes);
    request.files.add(await http.MultipartFile.fromPath('image', base64image));
    request.headers.addAll(headers);
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    return response;
  }

  static Future<ProfileModel> getData() async {
    Uri _getData = Uri.parse(ApiConst.baseUrl + '/driver-trips/<id>');
    http.Response response = await http.get(_getData);
    if (response.statusCode == 200) {
       final model=ProfileModel.fromJson(json.decode(response.body)[0]);
       return model;
    } else {
      throw Exception('Failed to load data');
    }
  }

}

// class Alarm{
//currentLocation,destination,distance,count,context
//   String id;
//   String name;
//  // double volume;
//   bool isSwitched=false;
//   String sound;
//   Alarm(this.id,this.name,this.sound);
//
// }
// // Alarm s1=Alarm('1', 'aml');
// // Alarm s2=Alarm('2', 'amal');
// // Alarm s3=Alarm('3', 'amalo');
// List<Alarm>alarms=[
//   Alarm('1', 'classic-alarm','assets/classic-alarm.wav',),
// Alarm('2', 'alert-alarm','assets/alert-alarm.wav'),
// Alarm('3', 'Alert_Alert','assets/warning-alarm.wav'),
// ];
