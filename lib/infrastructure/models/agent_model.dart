import 'package:payments/index.dart';

class AgentModel {
  final String? agentName;
  final String? agentNumber;
  final String? username;
  final String? idType;
  final String? idNumber;
  final String? isVerified;
  final String? branchId;
  final String? agentId;
  final String? active;

  // constructor
  AgentModel({
    this.agentName,
    this.agentNumber,
    this.username,
    this.idType,
    this.idNumber,
    this.isVerified,
    this.branchId,
    this.agentId,
    this.active
  });

  // from json
  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
    agentId: json["AgentId"].toString(),
    agentName: json["AgentName"].toString(),
    username: json["Username"].toString(),
    agentNumber: json["AgentNumber"].toString(),
    idType: json["idType"].toString(),
    idNumber: json["idNumber"].toString(),
    branchId: json["BranchId"].toString(),
    isVerified: json["IsVerified"].toString(),
    active: json["Active"].toString(),
  );

  // from map
  factory AgentModel.fromMap(Map<String, dynamic> map) {
    return AgentModel(
      agentId: map['AgentId'].toString(),
      agentName: map['AgentName'].toString(),
      username: map['Username'].toString(),
      agentNumber: map['AgentNumber'].toString(),
      idType: map['idType'].toString(),
      idNumber: map['idNumber'].toString(),
      branchId: map['BranchId'].toString(),
      isVerified: map['IsVerified'].toString(),
      active: map['Active'].toString(),
    );
  }

  // to json
  Map<String, dynamic> toJson() => {
    "agentId": agentId.toString(),
    "agentName": agentName.toString(),
    "username": username.toString(),
    "agentNumber": agentNumber.toString(),
    "idType": idType.toString(),
    "idNumber": idNumber.toString(),
    "branchId": branchId.toString(),
    "isVerified": isVerified.toString(),
    "active": active.toString(),
  };
}
