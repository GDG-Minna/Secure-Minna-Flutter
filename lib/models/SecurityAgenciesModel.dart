
class SecurityAgenciesModel {
  //data Type
  int? id;
  String? title;
  String? address;
  double? lat;
  double? long;
  String? phoneNumber1;
  String? phoneNumber2;
  String? phoneNumber3;
  String? phoneNumber4;
  String? email;

  SecurityAgenciesModel({
    this.id,
    this.title,
    this.address,
    this.lat,
    this.long,
    this.phoneNumber1,
    this.phoneNumber2,
    this.phoneNumber3,
    this.phoneNumber4,
    this.email
  });

  //method that assign values to respective datatype variables
  SecurityAgenciesModel.fromJson(Map<String,dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    phoneNumber1 = json['phoneNumber1'];
    phoneNumber2 = json['phoneNumber2'];
    phoneNumber3 = json['phoneNumber3'];
    phoneNumber4 = json['phoneNumber4'];
    email = json['email'];
  }
}