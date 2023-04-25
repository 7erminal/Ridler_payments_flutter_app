import 'package:flutter/material.dart';
import 'package:payments/index.dart';
import 'package:payments/infrastructure/actors/agent_actors.dart';
import 'package:payments/infrastructure/actors/finance_actors.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecipientInformation extends StatefulWidget {
  const RecipientInformation({Key? key}) : super(key: key);

  @override
  State<RecipientInformation> createState() => _RecipientInformationState();
}

class _RecipientInformationState extends State<RecipientInformation> {
  String _recipient_name = "1";
  final _formKey = GlobalKey<FormState>();

  TextEditingController recipientNameController = TextEditingController();
  TextEditingController recipientNumberController = TextEditingController();
  TextEditingController senderNameController = TextEditingController();
  TextEditingController senderNumberController = TextEditingController();

  late int selectedRecipientIndex;  //where I want to store the selected index
  late String initialRecipientDropDownVal;
  List<DropdownMenuItem<String>> recipients = [
    DropdownMenuItem<String>(
      child: Text("Branch 01"),
      value: "1",
    ),
    DropdownMenuItem<String>(
      child: Text("Branch 02"),
      value: "2",
    ),
    DropdownMenuItem<String>(
      child: Text("Branch 03"),
      value: "3",
    ),
    DropdownMenuItem<String>(
      child: Text("Branch 04"),
      value: "4",
    ),
  ];

  transfer(String senderName, String senderNumber, String recipientName, String recipientNumber, String source, String transactionType, var agentId, var branchId, var amount) async{
    dynamic transferFunds = await ApiHelperFunctions.transferFunds(senderName: senderName, senderNumber: senderNumber, recipientName: recipientName, recipientNumber: recipientNumber, source: source, transactionType: transactionType, agentId: agentId, branchId: branchId, amount: amount);

    return transferFunds;
  }

  @override
  Widget build(BuildContext context) {
    String? _recipient_number, _address, _comment;

    final agentActor = Provider.of<AgentActors>(context);
    final financeActor = Provider.of<FinanceActors>(context);

    String source = "app";
    String transactionType = "TRANSFER";


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
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Form(
            key: _formKey,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Recipient Information",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black26
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 5.0),
                //   child: DropdownButtonFormField<String>(
                //     value: _recipient_name,
                //     validator: (value) {
                //       if (value != null && value.isEmpty) {
                //         return 'Recipient Name?';
                //       }
                //     },
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       hintText: 'Select Recipient',
                //       labelText: 'Select Recipient',
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.blueAccent, width: 0.5),
                //       ),
                //     ),
                //     isExpanded: true,
                //     onChanged: (String? value){
                //       setState(() {
                //         initialRecipientDropDownVal = value!;
                //         _recipient_name = value!;
                //         selectedRecipientIndex=recipients.indexWhere((i)=>i.value==value);}
                //       );
                //     },
                //     autofocus: true,
                //     items: recipients,
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 5.0),
                //   child: TextFormField(
                //     // enabled: false,
                //     decoration: InputDecoration(
                //       labelText: 'Number',
                //       hintText: 'Number',
                //     ),
                //     validator: (value) {
                //       if (value != null && value.isEmpty) {
                //         return 'Please enter the number';
                //       }
                //       return null;
                //     },
                //     initialValue: _recipient_number,
                //     onSaved: (value) {
                //       _recipient_number = value;
                //     },
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 5.0),
                //   child: TextFormField(
                //     // enabled: false,
                //     decoration: InputDecoration(
                //       labelText: 'Address',
                //       hintText: 'Address',
                //     ),
                //     validator: (value) {
                //       if (value != null && value.isEmpty) {
                //         return 'Please enter the address';
                //       }
                //       return null;
                //     },
                //     initialValue: _address,
                //     onSaved: (value) {
                //       _address = value;
                //     },
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Sender Name',
                        hintText: 'Sender Name',
                        prefixIcon: Icon(Icons.man_sharp),
                        border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter sender name';
                      }
                      return null;
                    },
                    // initialValue: _address,
                    // onSaved: (value) {
                    //   _address = value;
                    // },
                    controller: senderNameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Sender Number',
                        hintText: 'Sender Number',
                        prefixIcon: Icon(Icons.numbers_outlined),
                        border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter sender number';
                      }
                      return null;
                    },
                    // initialValue: _address,
                    // onSaved: (value) {
                    //   _address = value;
                    // },
                    controller: senderNumberController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Recipient Name',
                        hintText: 'Recipient Name',
                        prefixIcon: Icon(Icons.man_sharp),
                        border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter recipient name';
                      }
                      return null;
                    },
                    // initialValue: _address,
                    // onSaved: (value) {
                    //   _address = value;
                    // },
                    controller: recipientNameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Recipient Number',
                        hintText: 'Recipient Number',
                        prefixIcon: Icon(Icons.numbers_outlined),
                        border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the recipients number';
                      }
                      return null;
                    },
                    // initialValue: _address,
                    // onSaved: (value) {
                    //   _address = value;
                    // },
                    controller: recipientNumberController,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //         labelText: 'Recipient Address',
                //         hintText: 'Recipient Address',
                //         prefixIcon: Icon(Icons.location_on_outlined),
                //         border: OutlineInputBorder()
                //     ),
                //     validator: (value) {
                //       if (value != null && value.isEmpty) {
                //         return '';
                //       }
                //       return null;
                //     },
                //     // initialValue: _address,
                //     // onSaved: (value) {
                //     //   _address = value;
                //     // },
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
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
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          try {
                            var transferResponse = await transfer(
                                senderNameController.text,
                                senderNumberController.text,
                                recipientNameController.text,
                                recipientNumberController.text,
                                source,
                                transactionType,
                                agentActor.agentModel_.agentId,
                                agentActor.agentModel_.branchId,
                                financeActor.transactionAmount);

                            debugPrint(
                                "Transfer response is $transferResponse");

                            var getAgentDetailsIfExists = await ApiHelperFunctions
                                .getAgentBalance(
                                agentId: agentActor.agentModel_.agentId!);

                            agentActor.updateBalance(
                                getAgentDetailsIfExists['Balance'].toString());

                            dynamic getAgentTransactionsIfExists = await ApiHelperFunctions
                                .getAgentTransactions(
                                agentId: agentActor.agentModel_.agentId!);

                            for (var transaction in getAgentTransactionsIfExists) {
                              // debugPrint("Service category is $serviceCat");
                              financeActor.addTransaction(
                                  TransactionModel.fromJson(transaction));
                            }

                            financeActor.updateTransaction(TransactionModel
                                .fromJson(transferResponse));
                            financeActor.updateRecentTransaction(
                                transactionType);
                          } catch(e){
                            Fluttertoast.showToast(
                                msg: "$e",
                                toastLength: Toast.LENGTH_SHORT, //duration
                                gravity: ToastGravity.BOTTOM, //location
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red, //background color
                                textColor: Colors.white, //text Color
                                fontSize: 16.0 //font size
                            );
                          }
                          context.loaderOverlay.hide();

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Invoice()),
                          );
                        }
                      },
                      child: Text(
                        'Transfer',
                        style: TextStyle(

                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
