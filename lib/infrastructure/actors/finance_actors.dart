import 'package:flutter/material.dart';
import 'package:payments/index.dart';

class FinanceActors with ChangeNotifier {
  TransactionModel transactionModel_ = TransactionModel();
  List<TransactionModel> transactions = [];
  String? phoneNumber;
  String? transactionAmount;
  String? recentTransaction;
  String? cashoutCode;

  // update customer subscription
  updateTransaction(dynamic newTransaction) {
    debugPrint("updating user model ${newTransaction}");
    this.transactionModel_ = newTransaction;

    // debugPrint("Now the model is ${userModel_.firstName}");
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

  setTransactionAmount(String val) {
    transactionAmount = val;
    notifyListeners();
  }

  updateRecentTransaction(String val) {
    recentTransaction = val;
    notifyListeners();
  }

  updateCashoutCode(String val) {
    cashoutCode = val;
    notifyListeners();
  }

  addTransaction(TransactionModel transaction) {
    debugPrint("add service to model");
    transactions.add(transaction);
    notifyListeners();
  }
}