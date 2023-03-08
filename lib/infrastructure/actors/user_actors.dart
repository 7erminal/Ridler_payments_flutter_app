import 'package:flutter/material.dart';
import 'package:payments/index.dart';

class UserActors with ChangeNotifier {
  UserModel userModel_ = UserModel();
  String? phoneNumber;
  String? type;

  // update customer subscription
  updateUser(dynamic newUser) {
    debugPrint("updating user model ${newUser.mobileNumber}");
    this.userModel_ = newUser;

    debugPrint("Now the model is ${userModel_.firstName}");
    try{
      debugPrint("About to notify listeners");
      notifyListeners();
    } catch (e){
      debugPrint("error returned is ");
      debugPrint("$e");
    }

  }

  updatePhone(String val) {
    phoneNumber = val;
    notifyListeners();
  }

  setType(String val) {
    type = val;
    notifyListeners();
  }
}