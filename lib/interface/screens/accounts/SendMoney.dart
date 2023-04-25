import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payments/infrastructure/actors/agent_actors.dart';
import 'package:payments/infrastructure/actors/finance_actors.dart';
import 'package:payments/interface/screens/accounts/recipientInformation.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final agentActor = Provider.of<AgentActors>(context);
    final financeActor = Provider.of<FinanceActors>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: <Widget>[
            Container(
                height: height*0.3,
                width: width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [const Color(0xff66b3ff), const Color(0xff9f9ffc)]
                    )
                ),
              child: Stack(
                children: [
                  Positioned(
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Enter amount',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffE6F2FE),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    // widthFactor: width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            'Your current balance is ${agentActor.balance}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffE6F2FE),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    widthFactor: width * 0.8,
                    child: Container(
                      width: width * 0.65,
                      child: TextField(
                        cursorHeight: 0,
                          cursorWidth: 0,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: const InputDecoration(
                              hintText: "0.00",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: const Color(0xffE6F2FE),
                              ),
                            //   labelText: "Enter Amount",
                            // labelStyle: TextStyle(
                            //   fontSize: 10,
                            // color: const Color(0xffE6F2FE),
                            // )
                            // icon: Icon(
                            //   Icons.ice_skating
                            // )
                          ),
                        style: TextStyle(
                          color: const Color(0xffE6F2FE),
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                        controller: amountController,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    child: Text(
                      "Sender Information",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black26
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              "${agentActor.agentModel_.agentName}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                        Row(
                          children: [
                            Text(
                              "Branch ${agentActor.agentModel_.branchId}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black87
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Color.fromRGBO(87, 86, 85, 0.82),),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              "Number",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                        Row(
                          children: [
                            Text(
                              "${agentActor.agentModel_.username}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black87
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        primary: Colors.white,
                        fixedSize: Size(95, 6),
                        backgroundColor: const Color(0xff66b3ff),
                      ),
                        onPressed: () {
                        try{
                          if (amountController.text != '' && double.parse(amountController.text) != null) {
                            if(double.parse(amountController.text) > 0 && double.parse(amountController.text) < double.parse(agentActor.balance!)){
                              financeActor.setTransactionAmount(amountController.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RecipientInformation()),
                              );
                            } else if (double.parse(amountController.text) > double.parse(agentActor.balance!)) {
                              Fluttertoast.showToast(
                                  msg: "You don't have enough funds to perform this transfer",
                                  toastLength: Toast.LENGTH_SHORT, //duration
                                  gravity: ToastGravity.BOTTOM, //location
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red, //background color
                                  textColor: Colors.white, //text Color
                                  fontSize: 16.0 //font size
                              );
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Enter an amount",
                                  toastLength: Toast.LENGTH_SHORT, //duration
                                  gravity: ToastGravity.BOTTOM, //location
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red, //background color
                                  textColor: Colors.white, //text Color
                                  fontSize: 16.0 //font size
                              );
                            }
                          } else {
                          Fluttertoast.showToast(
                          msg: "Enter an amount",
                          toastLength: Toast.LENGTH_SHORT, //duration
                          gravity: ToastGravity.BOTTOM, //location
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red, //background color
                          textColor: Colors.white, //text Color
                          fontSize: 16.0 //font size
                          );
                          }
                        } catch (e){
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


                        },
                      child: Text('Continue'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
