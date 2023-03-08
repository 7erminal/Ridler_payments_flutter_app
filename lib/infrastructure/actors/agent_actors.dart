import 'package:flutter/material.dart';
import 'package:payments/index.dart';
import 'package:payments/infrastructure/models/agent_model.dart';

class AgentActors with ChangeNotifier {
  AgentModel agentModel_ = AgentModel();
  String? phoneNumber;
  String? balance;

  // update customer subscription
  updateAgent(dynamic newAgent) {
    // debugPrint("updating user model ${newAgent.mobileNumber}");
    this.agentModel_ = newAgent;

    debugPrint("Now the model is ${agentModel_.username}");
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

  updateBalance(String val) {
    balance = val;
    notifyListeners();
  }

}