import 'dart:convert';

class HistoryModel {
  final double distance;

  //final int time;
  final String currentLocation;
  final String destinationLocation;
  final double discoveredDistance;
  final int tripCompleted;

  HistoryModel({required this.distance, required this.currentLocation, required this.destinationLocation,required this.discoveredDistance,required this.tripCompleted});
  factory HistoryModel.fromJson(Map<String, dynamic> data){
    return HistoryModel(
        distance:data['distance'],
        currentLocation:data['currentLocation'],
        destinationLocation:data['destination'],
        discoveredDistance: data['discoveredDistance'],
        tripCompleted: data['tripCompleted']
    );

  }
  Map<String,dynamic>toJson()=>{
    'distance':distance,
    'currentLocation':currentLocation,
    'destination':destinationLocation,

  };
}
List<HistoryModel> userModelFromJson(String str) =>
    List<HistoryModel>.from(json.decode(str).map((x) => HistoryModel.fromJson(x)));
// String userModelToJson(List<HistoryModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
