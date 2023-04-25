import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:payments/index.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CashoutInformation extends StatefulWidget {
  const CashoutInformation({Key? key}) : super(key: key);

  @override
  State<CashoutInformation> createState() => _CashoutInformationState();
}

class _CashoutInformationState extends State<CashoutInformation> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController recipientNameController = TextEditingController();
  TextEditingController recipientNumberController = TextEditingController();

  cashout(String amount, String code, String recipientName, String recipientNumber, String source, String transactionType, String agentId, String branchId) async{
    dynamic cashoutResponse = await ApiHelperFunctions.cashoutTransaction(amount: amount, code: code, recipientName: recipientName, recipientNumber: recipientNumber, source: source, transactionType: transactionType, agentId: agentId, branchId: branchId);

    return cashoutResponse;
  }

  @override
  Widget build(BuildContext context) {

    final agentActor = Provider.of<AgentActors>(context);
    final financeActor = Provider.of<FinanceActors>(context);

    String source = "app";
    String transactionType = "CASHOUT";

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
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Cash out Information',
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xff3BFC75)
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Text(
                        'Sending Branch',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xff2E4053)
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Branch ${agentActor.agentModel_.branchId}',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xff2E4053)
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Text(
                        'Sender',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xff2E4053)
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${financeActor.transactionModel_.senderName}',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xff2E4053)
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Text(
                        'Amount',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xff2E4053)
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Le ${financeActor.transactionModel_.amount}',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xff2E4053)
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Text(
                        'Sender Agent ID',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xff2E4053)
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${financeActor.transactionModel_.sendingAgentId}',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xff2E4053)
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter Receiver's Name",
                        hintText: 'Enter Name',
                        prefixIcon: Icon(Icons.perm_identity_sharp),
                        border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You need to enter the recipient name';
                      }
                      return null;
                    },
                    controller: recipientNameController,
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
                        labelText: "Enter Receiver's Number",
                        hintText: 'Enter Number',
                        prefixIcon: Icon(Icons.perm_identity_sharp),
                        border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You need to enter the recipient number';
                      }
                      return null;
                    },
                    controller: recipientNumberController,
                    // initialValue: _address,
                    // onSaved: (value) {
                    //   _address = value;
                    // },
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
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {

                        context.loaderOverlay.show();

                        dynamic cashout_ = await cashout(
                            financeActor.transactionAmount ?? "",
                            financeActor.cashoutCode ?? "",
                            recipientNameController.text,
                            recipientNumberController.text,
                            source,
                            transactionType,
                            agentActor.agentModel_.agentId!,
                            agentActor.agentModel_.branchId!);
                        ApiHelperFunctions.getAgentBalance(
                            agentId: agentActor.agentModel_.agentId!);

                        dynamic getAgentTransactionsIfExists = await ApiHelperFunctions
                            .getAgentTransactions(
                            agentId: agentActor.agentModel_.agentId!);
                        financeActor.transactions.clear();
                        for (var transaction in getAgentTransactionsIfExists) {
                          // debugPrint("Service category is $serviceCat");
                          financeActor.addTransaction(
                              TransactionModel.fromJson(transaction));
                        }

                        debugPrint("Cashout response is");
                        debugPrint("$cashout_");
                        debugPrint("${cashout_.runtimeType}");

                        if (cashout_ != null && cashout_.runtimeType != String) {
                          debugPrint("in success");
                          financeActor.updateTransaction(
                              TransactionModel.fromJson(cashout_));
                          context.loaderOverlay.hide();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Invoice()),
                          );
                        } else {
                          context.loaderOverlay.hide();
                          debugPrint("show toast");
                            Fluttertoast.showToast(
                                msg: cashout_,
                                toastLength: Toast.LENGTH_SHORT, //duration
                                gravity: ToastGravity.BOTTOM, //location
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red, //background color
                                textColor: Colors.white, //text Color
                                fontSize: 16.0 //font size
                            );

                        }
                      }
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(

                      ),
                    )
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
