import 'package:payments/index.dart';

class TransactionModel {
  final String? transactionId;
  final String? sendingAgentId;
  final String? receivingAgentId;
  final String? sendingBranchId;
  final String? receivingBranchId;
  final String? senderName;
  final String? senderNumber;
  final String? receiverName;
  final String? receiverNumber;
  final String? statusCode;
  final String? transactionCode;
  final String? amount;
  final String? active;
  final String? transactionDate;
  final String? transactionType;

  // constructor
  TransactionModel({
    this.transactionId,
    this.sendingAgentId,
    this.receivingAgentId,
    this.sendingBranchId,
    this.receivingBranchId,
    this.senderName,
    this.senderNumber,
    this.receiverName,
    this.receiverNumber,
    this.statusCode,
    this.transactionCode,
    this.amount,
    this.active,
    this.transactionDate,
    this.transactionType
  });

  // from json
  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    transactionId: json["TransactionId"].toString(),
    sendingAgentId: json["SendingAgentId"].toString(),
    receivingAgentId: json["ReceivingAgentId"].toString(),
    sendingBranchId: json["SendingBranchId"].toString(),
    receivingBranchId: json["ReceivingBranchId"].toString(),
    senderName: json["SenderName"].toString(),
    senderNumber: json["SenderNumber"].toString(),
    receiverName: json["ReceiverName"].toString(),
    receiverNumber: json["ReceiverNumber"].toString(),
    statusCode: json["StatusCode"].toString(),
    transactionCode: json["TransactionCode"].toString(),
    amount: json["Amount"].toString(),
    active: json["Active"].toString(),
      transactionDate: json["DateCreated"].toString(),
      transactionType: json["TransactionType"].toString()
  );

  // from map
  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      transactionId: map['TransactionId'].toString(),
      sendingAgentId: map['SendingAgentId'].toString(),
      receivingAgentId: map['ReceivingAgentId'].toString(),
      sendingBranchId: map['SendingBranchId'].toString(),
      receivingBranchId: map['ReceivingBranchId'].toString(),
      senderName: map['SenderName'].toString(),
      senderNumber: map['SenderNumber'].toString(),
      receiverName: map['ReceiverName'].toString(),
      receiverNumber: map['ReceiverNumber'].toString(),
      statusCode: map['StatusCode'].toString(),
      transactionCode: map['TransactionCode'].toString(),
      amount: map['Amount'].toString(),
      active: map['Active'].toString(),
      transactionDate: map['DateCreated'].toString(),
      transactionType: map['TransactionType'].toString(),
    );
  }

  // to json
  Map<String, dynamic> toJson() => {
    "sendingAgentId": sendingAgentId.toString(),
    "SendingAgentId": sendingAgentId.toString(),
    "ReceivingAgentId": receivingAgentId.toString(),
    "SendingBranchId": sendingBranchId.toString(),
    "ReceivingBranchId": receivingBranchId.toString(),
    "SenderName": senderName.toString(),
    "SenderNumber": senderNumber.toString(),
    "ReceiverName": receiverName.toString(),
    "ReceiverNumber": receiverNumber.toString(),
    "StatusCode": statusCode.toString(),
    "TransactionCode": transactionCode.toString(),
    "Amount": amount.toString(),
    "Active": active.toString(),
    "DateCreated": transactionDate.toString(),
    "TransactionType": transactionType.toString()
  };
}
