import 'dart:convert';

class TripModel {
   int? driver_id;
   int? id;
  final double distance;

  //final int count;
  //final int time;
  final String currentLocation;
  final String destinationLocation;

  //final double discoveredDistance;
  //final int tripCompleted;

  TripModel(
      {required this.distance,
      required this.currentLocation,
      required this.destinationLocation,
        this.id,
       this.driver_id});

  factory TripModel.fromJson(Map<String, dynamic> data) {
    return TripModel(
      id: data['id'],
      driver_id: data['driver_id'],
      //count: data['count'],
      distance: data['distance'],
      currentLocation: data['start_loc'],
      destinationLocation: data['destination'],
      // discoveredDistance: data['discoveredDistance'],
      // tripCompleted: data['tripCompleted']
    );
  }

  Map<String, dynamic> toJson() => {
        //'driver_id':driver_id,
        'distance': distance,
        'start_loc': currentLocation,
        'destination': destinationLocation,
      };
}

List<TripModel> userModelFromJson(String str) =>
    List<TripModel>.from(json.decode(str).map((x) => TripModel.fromJson(x)));
// String userModelToJson(List<HistoryModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
