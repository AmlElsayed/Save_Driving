import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:safe_driving_app/constants.dart';
import 'package:safe_driving_app/models/history.dart';
import 'package:safe_driving_app/models/profile_data.dart';

import '../screens/Navigat_page.dart';

class HttpService {
  static final _client = http.Client();
  static var _loginUrl = Uri.parse(ApiConst.baseUrl + ApiConst.login);
  static var _registerUrl = Uri.parse(ApiConst.baseUrl + ApiConst.register);
  static var _uploadUrl = Uri.parse(ApiConst.baseUrl + ApiConst.register);
  static var _uploadProfileUrl =
      Uri.parse(ApiConst.baseUrl + ApiConst.register);

  //Future<void>
  static login(email, password, context) async {
    http.Response response = await _client
        .post(_loginUrl, body: {"email": email, "password": password});
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var json = jsonDecode(response.body);
      if (json[0] == 'Driver logged in successfully') {
        await EasyLoading.showSuccess(json[0]);
        await Navigator.pushNamed(context, NavigationBarPage().id);
      } else {
        await EasyLoading.showError(json[0]);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static register(email, password, name, context) async {
    http.Response response = await _client.post(_registerUrl,
        body: {"name": name, "email": email, "password": password});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json[0] == 'this user already exists!') {
        await EasyLoading.showError(json[0]);
      } else {
        await EasyLoading.showSuccess(json[0]);
        await Navigator.pushReplacementNamed(context, NavigationBarPage().id);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  Future<List<HistoryModel>?> tripDetails() async {
    http.Response response = await _client.get(_registerUrl);
    if (response.statusCode == 200) {
      List<HistoryModel> model = userModelFromJson(response.body);
      return model;
    }
    return null;
  }

  static postTripDetails(data) async {
    http.Response response =
        await _client.post(_registerUrl, body: jsonEncode(data));
    return response;
    // if (response.statusCode==200){
    //   String model=userModelToJson();
    //   return model;
  }

  static Future<http.Response> uploadImage(File image) async {
    String filename = image.path.split('/').last;
    final request = http.MultipartRequest('POST', _uploadUrl);
    final headers = {'Content-type': 'multipart/from-data'};
    Uint8List imageBytes = await image.readAsBytes(); //convert to bytes
    String base64image =
        base64Encode(imageBytes); //convert bytes to base64 string
    ///For sending files/images/videos
    request.files.add(await http.MultipartFile.fromPath('image', base64image)
        // request.files.add(http.MultipartFile('image',image.readAsBytes().asStream(),image.lengthSync(),filename: filename),
        );
    request.headers.addAll(headers);

    ///to complete the multipartrequest
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    return response;
  }

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
    http.Response response = await http.get(_loginUrl);
    if (response.statusCode == 200) {
       final model=ProfileModel.fromJson(jsonDecode(response.body));
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
