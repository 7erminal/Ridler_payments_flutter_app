import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:payments/index.dart';
// import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
// import 'package:image/image.dart';

class ApiHelperFunctions {

  /*
  * ######################################################
  * ############## Get user using phone number #########################
  * ######################################################
  * */

  static Future<dynamic> getUserWithPhoneNumber({
    required String phoneNumber,
  }) async {
    try {
      // debugPrint("Path ${ApisPaths.getCustomerLeadApi(phoneNumber: phoneNumber)}");
      // debugPrint('data number $phoneNumber');
      dynamic resp = await ApisCaller.instance.getData(
          path: ApisPaths.getUserWithPhoneNumber(phoneNumber: phoneNumber),
          builder: (data) {
            // debugPrint("mobile number data returned $data");
            return data[0];
          });
      return resp;
    } catch (e) {
      debugPrint("Error is $e");
      return null;
    }
  }

  /*
  * #####################################
  * ############ Validate credentials ##############
  * #####################################
  * */
  static Future<dynamic> validateCredentials({
    required String username,
    required String password,
    // required String otp,
  }) async {
    try {

      dynamic params = {"Username": username, "Password": password};

      // debugPrint("params are ${params['number']}");

      dynamic resp = await ApisCaller.instance.postData(
          path: ApisPaths.validateCredentialsUrl,
          body: params,
          builder: (data) {
            debugPrint('data returned ... $data');
            return data;
          });
      return resp;
    } catch (e) {
      return null;
    }
  }


  /*
  * ######################################################
  * ############## Get agent balance #########################
  * ######################################################
  * */

  static Future<dynamic> getAgentBalance({
    required String agentId,
  }) async {
    try {
      // debugPrint("Path ${ApisPaths.getCustomerLeadApi(phoneNumber: phoneNumber)}");
      debugPrint('agent ID $agentId');
      dynamic resp = await ApisCaller.instance.getData(
          path: ApisPaths.getAgentBalanceWithID(agentId: agentId),
          builder: (data) {
            debugPrint("mobile number data returned $data");
            return data;
          });
      return resp;
    } catch (e) {
      debugPrint("Error is $e");
      return null;
    }
  }

  /*
  * ######################################################
  * ############## Get agent transactions #########################
  * ######################################################
  * */

  static Future<dynamic> getAgentTransactions({
    required String agentId,
  }) async {
    try {
      // debugPrint("Path ${ApisPaths.getCustomerLeadApi(phoneNumber: phoneNumber)}");
      debugPrint('agent ID $agentId');
      dynamic resp = await ApisCaller.instance.getData(
          path: ApisPaths.getAgentTransactionsWithAgentID(agentId: agentId),
          builder: (data) {
            debugPrint("transactions data returned $data");
            return data;
          });
      return resp;
    } catch (e) {
      debugPrint("Error is $e");
      return null;
    }
  }

  /*
  * ######################################################
  * ############## Get agent transfers #########################
  * ######################################################
  * */

  static Future<dynamic> getAgentTransfers({
    required String agentId,
  }) async {
    try {
      // debugPrint("Path ${ApisPaths.getCustomerLeadApi(phoneNumber: phoneNumber)}");
      debugPrint('agent ID $agentId');
      dynamic resp = await ApisCaller.instance.getData(
          path: ApisPaths.getAgentTransfersWithAgentID(agentId: agentId),
          builder: (data) {
            debugPrint("transactions data returned $data");
            return data;
          });
      return resp;
    } catch (e) {
      debugPrint("Error is $e");
      return null;
    }
  }

  /*
  * ######################################################
  * ############## Get agent cashouts #########################
  * ######################################################
  * */

  static Future<dynamic> getAgentCashouts({
    required String agentId,
  }) async {
    try {
      // debugPrint("Path ${ApisPaths.getCustomerLeadApi(phoneNumber: phoneNumber)}");
      debugPrint('agent ID $agentId');
      dynamic resp = await ApisCaller.instance.getData(
          path: ApisPaths.getAgentCashoutsWithAgentID(agentId: agentId),
          builder: (data) {
            debugPrint("transactions data returned $data");
            return data;
          });
      return resp;
    } catch (e) {
      debugPrint("Error is $e");
      return null;
    }
  }

  /*
  * #####################################
  * ############ Transfer funds ##############
  * #####################################
  * */
  static Future<dynamic> transferFunds({
    required String senderName,
    required String senderNumber,
    required String recipientName,
    required String recipientNumber,
    required String source,
    required String transactionType,
    required String amount,
    required String agentId,
    required String branchId,
    // required String otp,
  }) async {
    try {

      dynamic params = {"SenderName": senderName, "SenderNumber": senderNumber, "ReceiverName": recipientName, "ReceiverNumber": recipientNumber, "Source": source, "TransactionType": transactionType, "Amount": double.parse(amount), "SendingAgentId": int.parse(agentId), "SendingBranchId": int.parse(branchId)};

      debugPrint("params are ${params}");

      dynamic resp = await ApisCaller.instance.postData(
          path: ApisPaths.transactionsUrl,
          body: params,
          builder: (data) {
            debugPrint('data returned ... $data');
            return data;
          });
      return resp;
    } catch (e) {
      return null;
    }
  }

  /*
  * #####################################
  * ############ Cashout details ##############
  * #####################################
  * */
  static Future<dynamic> cashoutDetails({
    required String code,
    required String recipientName,
    required String recipientNumber,
    required String source,
    required String transactionType,
    required String amount,
    required String agentId,
    required String branchId,
    // required String otp,
  }) async {
    try {

      dynamic params = {"Code": code, "ReceiverName": recipientName, "ReceiverNumber": recipientNumber, "Source": source, "TransactionType": transactionType, "Amount": double.parse(amount), "ReceivingAgentId": int.parse(agentId), "ReceivingBranchId": int.parse(branchId)};

      debugPrint("params are ${params}");

      dynamic resp = await ApisCaller.instance.postData(
          path: ApisPaths.cashoutDetailsUrl,
          body: params,
          builder: (data) {
            debugPrint('data returned ... $data');
            return data;
          });
      return resp;
    } catch (e) {
      return null;
    }
  }

  /*
  * #####################################
  * ############ Cashout transaction ##############
  * #####################################
  * */
  static Future<dynamic> cashoutTransaction({
    required String code,
    required String recipientName,
    required String recipientNumber,
    required String source,
    required String transactionType,
    required String amount,
    required String agentId,
    required String branchId,
    // required String otp,
  }) async {
    try {

      dynamic params = {"Code": code, "ReceiverName": recipientName, "ReceiverNumber": recipientNumber, "Source": source, "TransactionType": transactionType, "Amount": double.parse(amount), "ReceivingAgentId": int.parse(agentId), "ReceivingBranchId": int.parse(branchId)};

      debugPrint("params are ${params}");

      dynamic resp = await ApisCaller.instance.postData(
          path: ApisPaths.cashoutUrl,
          body: params,
          builder: (data) {
            debugPrint('data returned ... $data');
            return data;
          });
      return resp;
    } catch (e) {
      return null;
    }
  }

  /*
  * #####################################
  * ############ VALIDATE OTP ##############
  * #####################################
  * */
  // static Future<dynamic> validateOTP({
  //   required String otpType,
  //   required String mobileNumber,
  //   required String otp,
  //   // required String otp,
  // }) async {
  //   try {
  //     // debugPrint('path ${ApisPaths.postLeadsApi}');
  //
  //     // to json
  //     // dynamic params = Map<String, dynamic> toJson() => {
  //     //   "number": mobileNumber.toString(),
  //     //   // "lastName": otp.toString(),
  //     //   "otp_type": otpType.toString(),
  //     // };
  //
  //     dynamic params = {"number": mobileNumber, "otp_type": otpType, "otp": otp};
  //
  //     debugPrint("params are ${params}");
  //
  //     dynamic resp = await ApisCaller.instance.postData(
  //         path: ApisPaths.validateOTPUrl,
  //         body: params,
  //         builder: (data) {
  //           debugPrint('OTP Returned ... $data');
  //           return data;
  //         });
  //     return resp;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  /*
  * #####################################
  * ############ CREATE PROFILE #########
  * #####################################
  * */
  // static Future<dynamic> createProfile({
  //   required String firstname,
  //   required String lastname,
  //   required String dob,
  //   required String gender,
  //   required String mobilenumber,
  //   required String email,
  //   // required String otp,
  // }) async {
  //   try {
  //
  //     dynamic params = {"first_name": firstname, "last_name": lastname, "dob": dob, "gender": gender, "mobile_number": mobilenumber, "email": email};
  //
  //     debugPrint("params are ${params['number']}");
  //
  //     dynamic resp = await ApisCaller.instance.postData(
  //         path: ApisPaths.registerCustomerUrl,
  //         body: params,
  //         builder: (data) {
  //           debugPrint('Registration ... $data');
  //           return data[0];
  //         });
  //     return resp;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  /*
  * #####################################
  * ############ UPDATE PROFILE #########
  * #####################################
  * */
  // static Future<dynamic> updateProfile({
  //   required var id,
  //   required String firstname,
  //   required String lastname,
  //   required String othernames,
  //   required String email,
  //   required String address,
  //   required String idtype,
  //   required String idnumber,
  //   required String nationality,
  //   required String location,
  //   required String profession
  //   // required String otp,
  // }) async {
  //   try {
  //
  //     dynamic params = {"id": id, "first_name": firstname, "last_name": lastname, "other_names": othernames, "email": email, "address": address, "id_type": idtype, "id_number": idnumber, "nationality": nationality, "location": location, "profession": profession};
  //
  //     debugPrint("params are $params");
  //
  //     dynamic resp = await ApisCaller.instance.postData(
  //         path: ApisPaths.updateCustomerUrl,
  //         body: params,
  //         builder: (data) {
  //           debugPrint('Update ... $data');
  //           return data[0];
  //         });
  //     return resp;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  /*
  * #####################################
  * ############ HOST SERVICE ###########
  * #####################################
  * */
  // static Future<dynamic> hostService({
  //   required String parentService,
  //   required String service_name,
  //   required String description,
  //   required String location,
  //   required List? process,
  //   required String duration,
  //   required String price,
  //   List<XFile>? pictures,
  //   String? userid,
  //   // required String otp,
  // }) async {
  //   try {
  //     var params;
  //     debugPrint("Process is $process ");
  //
  //     String processListString = "";
  //
  //     if(process != null){
  //       processListString = process.join(",");
  //     }
  //
  //     if(pictures != null){
  //       debugPrint("pictures are loaded. Process is $process");
  //       params = FormData.fromMap({
  //         "id": userid,
  //         "parent_service": parentService,
  //         "service_name": service_name,
  //         "description": description,
  //         "location": location,
  //         "process": processListString,
  //         "duration": duration,
  //         "price": price,
  //         "pictures": [
  //           for(var file in pictures!){
  //             await MultipartFile.fromFile(file.path),
  //           }.toList()
  //         ]
  //       });
  //     } else {
  //       debugPrint("pictures are not loaded");
  //       params = {"id": userid, "parent_service": parentService, "service_name": service_name, "description": description, "location": location, "process": process, "duration": duration, "price": price};
  //     }
  //
  //
  //     debugPrint("params are $params");
  //
  //     // var formData = FormData();
  //     // for(var file in pictures!){
  //     //   formData.files.addAll([
  //     //     MapEntry("pictures", await MultipartFile.fromFile(file.path)),
  //     //   ]);
  //     // }
  //
  //     dynamic resp = await ApisCaller.instance.postData(
  //         path: ApisPaths.hostService,
  //         queryParameters: params,
  //         builder: (data) {
  //           return data;
  //         });
  //     return resp;
  //   } catch (e) {
  //     return null;
  //   }
  // }


  /*
  * #####################################
  * ############ GET ESSENTIALS #########
  * #####################################
  * */
  // static Future<dynamic> getEssentials() async {
  //   try {
  //
  //     dynamic resp = await ApisCaller.instance.getData(
  //         path: ApisPaths.getEssentials,
  //         builder: (data) {
  //           // debugPrint('Essentials Returned ... $data');
  //           return data;
  //         });
  //     return resp;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  /*
  * #####################################
  * ############ GET HOSTED SERVICES #########
  * #####################################
  * */
  // static Future<dynamic> getHostedServices() async {
  //   try {
  //
  //     dynamic resp = await ApisCaller.instance.getData(
  //         path: ApisPaths.getHostedServices,
  //         builder: (data) {
  //           // debugPrint('Essentials Returned ... $data');
  //           return data;
  //         });
  //     return resp;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  /*
  * #####################################
  * ############ GET HOSTED SERVICES BY CATEGORY #########
  * #####################################
  * */
  // static Future<dynamic> getHostedServicesByCategory({
  //   required String serviceid,
  // }) async {
  //   try {
  //
  //     dynamic resp = await ApisCaller.instance.getData(
  //         path: ApisPaths.getHostedServicesByCategory(serviceid: serviceid),
  //         builder: (data) {
  //           // debugPrint('Essentials Returned ... $data');
  //           return data;
  //         });
  //     return resp;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  /*
  * #####################################
  * ############ GET SERVICE REVIEWS #########
  * #####################################
  * */
  // static Future<dynamic> getServiceReviews({
  //   required String serviceid,
  // }) async {
  //   try {
  //     // debugPrint("Path ${ApisPaths.getCustomerLeadApi(phoneNumber: phoneNumber)}");
  //     // debugPrint('data number $phoneNumber');
  //     dynamic resp = await ApisCaller.instance.getData(
  //         path: ApisPaths.getServiceReviews(serviceid: serviceid),
  //         builder: (data) {
  //           // debugPrint("mobile number data returned $data");
  //           return data[0];
  //         });
  //     return resp;
  //   } catch (e) {
  //     debugPrint("Error is $e");
  //     return null;
  //   }
  // }

  /*
  * #####################################
  * ############ ADD SERVICE REVIEW #########
  * #####################################
  * */
  // static Future<dynamic> addServiceReview({
  //   required String hostedserviceid,
  //   required String review,
  //   required String userid,
  //   // required String otp,
  // }) async {
  //   try {
  //
  //     dynamic params = {"hosted_service_id": hostedserviceid, "review": review, "user_id": userid};
  //
  //     debugPrint("params are ${params['review']}");
  //
  //     dynamic resp = await ApisCaller.instance.postData(
  //         path: ApisPaths.addReview,
  //         body: params,
  //         builder: (data) {
  //           debugPrint('Registration ... $data');
  //           return data[0];
  //         });
  //     return resp;
  //   } catch (e) {
  //     return null;
  //   }
  // }


}

