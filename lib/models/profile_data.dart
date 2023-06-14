import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';
class ProfileModel{
  static var _loginUrl=Uri.parse(ApiConst.baseUrl+ApiConst.login);
  final int id;
  final String name;
  final String email;
  final String phone;
  final int rideCompleted;
  final double totalDistance;
  ProfileModel({required this.id,   required this.name, required this.email, required this.phone, required this.totalDistance, required this.rideCompleted});
  factory ProfileModel.fromJson(Map<String,dynamic> data){
    return ProfileModel(
      id:data['id']as int,
        name:data['name'],
        email:data['email'],
        phone:data['phone'],
        totalDistance:data['totalDistance'],
        rideCompleted:data['rideCompleted']
    );
  }

  // Map<String,dynamic>toJson()=>{
  //   'name':name,
  //   'email':email,
  //   'phone':phone,
  //   'totalDistance':totalDistance,
  //   'rideCompleted':rideCompleted
  // };



}