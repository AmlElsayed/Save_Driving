
class ProfileModel{
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String image;
final double rate;
final String username;
final int institute;
final String password;
final double totalDistance;
  ProfileModel({ required this.id, required this.firstname,
    required this.lastname,required this.rate,
    required this.totalDistance,required this.password,
    required this.email, required this.image, required this.institute, required this.username});
  factory ProfileModel.fromJson(Map<String,dynamic> data){
    return ProfileModel(
      id:data['id'],
        firstname:data['firstname'],
        lastname:data['lastname'],
        email:data['email'],
        password:data['password'],
        image:data['profile_photo'],
        rate:data['rate'],
        username:data['username'],
        totalDistance:data['total_distance'],
        institute:data['institute_id'],
    );
  }

  // Map<String,dynamic>toJson()=>{
  //   'driver_id':id,
  //   'finame':name,
  //   'email':email,
  //   'phone':phone,
  //   'totalDistance':totalDistance,
  //   'rideCompleted':rideCompleted
  // };
  // String userModelToJson(List<ProfileModel> data) =>
  //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


}