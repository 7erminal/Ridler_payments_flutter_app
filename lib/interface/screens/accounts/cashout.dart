import 'package:flutter/material.dart';
import 'package:payments/index.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Cashout extends StatefulWidget {
  const Cashout({Key? key}) : super(key: key);

  @override
  State<Cashout> createState() => _CashoutState();
}

class _CashoutState extends State<Cashout> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final agentActor = Provider.of<AgentActors>(context);
    final financeActor = Provider.of<FinanceActors>(context);

    String source = "app";
    String transactionType = "CASHOUT";

    TextEditingController cashoutCodeController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(),
      body: LoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
          child: SpinKitFoldingCube(
            color: Color(0xff5BADFC),
            size: 50.0,
          ),
        ),
        overlayOpacity: 0.8,
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: height*0.4,
                  width: width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              'Please enter the CashOut code',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Enter code',
                              hintText: 'Enter code',
                              prefixIcon: Icon(Icons.code),
                                border: OutlineInputBorder()
                            ),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Please enter the cashout code';
                              }
                              return null;
                            },
                            controller: cashoutCodeController,
                            // initialValue: _address,
                            // onSaved: (value) {
                            //   _address = value;
                            // },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Enter amount',
                                hintText: 'Enter amount',
                                prefixIcon: Icon(Icons.money),
                                border: OutlineInputBorder()
                            ),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Please enter the amount';
                              }
                              return null;
                            },
                            controller: amountController,
                            // initialValue: _address,
                            // onSaved: (value) {
                            //   _address = value;
                            // },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      primary: Colors.white,
                      fixedSize: Size(width, 6),
                      backgroundColor: const Color(0xff66b3ff),
                    ),
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        context.loaderOverlay.show();
                        financeActor.setTransactionAmount(amountController.text);
                        financeActor.updateCashoutCode(cashoutCodeController.text);

                        dynamic cashoutDetails = await ApiHelperFunctions.cashoutDetails(amount: amountController.text, code: cashoutCodeController.text, recipientName: "", recipientNumber: "", source: source, transactionType: transactionType, agentId: agentActor.agentModel_.agentId!, branchId: agentActor.agentModel_.branchId!);

                        debugPrint("Cashout Details are $cashoutDetails");
                        debugPrint("${cashoutDetails.runtimeType}");
                        if(cashoutDetails != null && cashoutDetails.runtimeType != "String") {
                          financeActor.updateTransaction(
                              TransactionModel.fromJson(cashoutDetails));
                          financeActor.updateRecentTransaction(transactionType);
                          context.loaderOverlay.hide();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CashoutInformation()),
                          );
                        } else {
                          context.loaderOverlay.hide();
                        }
                      }
                    },
                    child: Text(
                      'Cash Out',
                      style: TextStyle(

                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
