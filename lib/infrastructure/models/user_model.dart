import 'package:payments/index.dart';

class UserModel {
  final String? firstName;
  final String? lastName;
  final String? otherNames;
  final String? gender;
  final String? mobileNumber;
  final String? email;
  final String? address;
  final String? idType;
  final String? idNumber;
  final String? nationality;
  final String? location;
  final String? profession;
  final String? is_host;
  final String? type;
  final String? id;

  // constructor
  UserModel({
    this.firstName,
    this.lastName,
    this.otherNames,
    this.gender,
    this.mobileNumber,
    this.email,
    this.address,
    this.idType,
    this.idNumber,
    this.nationality,
    this.profession,
    this.is_host,
    this.type,
    this.id,
    this.location
  });

  // from json
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"].toString(),
    firstName: json["firstName"].toString(),
    lastName: json["lastName"].toString(),
    otherNames: json["otherNames"].toString(),
    gender: json["gender"].toString(),
    mobileNumber: json["mobileNumber"].toString(),
    email: json["email"].toString(),
    address: json["address"].toString(),
    idType: json["idType"].toString(),
    idNumber: json["idNumber"].toString(),
    nationality: json["nationality"].toString(),
    profession: json["profession"].toString(),
    location: json["location"].toString(),
    is_host: json["is_host"].toString(),
    type: json["type"].toString(),
  );

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'].toString(),
      firstName: map['firstName'].toString(),
      lastName: map['lastName'].toString(),
      otherNames: map['otherNames'].toString(),
      gender: map['gender'].toString(),
      mobileNumber: map['mobileNumber'].toString(),
      email: map['email'].toString(),
      address: map['address'].toString(),
      idType: map['idType'].toString(),
      idNumber: map['idNumber'].toString(),
      nationality: map['nationality'].toString(),
      profession: map['profession'].toString(),
      location: map['location'].toString(),
      is_host: map['is_host'].toString(),
      type: map['type'].toString(),
    );
  }

  // to json
  Map<String, dynamic> toJson() => {
    "id": id.toString(),
    "firstName": firstName.toString(),
    "lastName": lastName.toString(),
    "otherNames": otherNames.toString(),
    "gender": gender.toString(),
    "mobileNumber": mobileNumber.toString(),
    "email": email.toString(),
    "address": address.toString(),
    "idType": idType.toString(),
    "idNumber": idNumber.toString(),
    "nationality": nationality.toString(),
    "profession": profession.toString(),
    "location": location.toString(),
    "is_host": is_host.toString(),
    "type": type.toString(),
  };
}
