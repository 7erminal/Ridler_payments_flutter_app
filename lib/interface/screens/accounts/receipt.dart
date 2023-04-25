import 'package:flutter/material.dart';
import 'package:payments/index.dart';
import 'package:provider/provider.dart';

class Invoice extends StatelessWidget {
  const Invoice({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final agentActor = Provider.of<AgentActors>(context);
    final financeActor = Provider.of<FinanceActors>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var date_ = HelperFunctions.formatDrawDate(financeActor.transactionModel_.transactionDate!);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
          height: height,
        width: width,
        color: const Color(0xffEEF6FE),
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 35),
        child: ListView(
          children: <Widget>[
            Container(
              height: height*0.3,
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Spacer(),
                        Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20
                            ),
                            '${agentActor.agentModel_.username}'
                        ),
                        Spacer()
                      ],
                    ),
                    SizedBox(height: 8.0,),
                    Row(
                      children: <Widget>[
                        Spacer(),
                        Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20
                            ),
                            'Transaction Code'
                        ),
                        Spacer()
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Spacer(),
                        Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22
                            ),
                            '${financeActor.transactionModel_.transactionCode}'
                        ),
                        Spacer()
                      ],
                    ),
                    SizedBox(height: 8.0,),
                    Row(
                      children: <Widget>[
                        Spacer(),
                        Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20
                            ),
                            '${financeActor.recentTransaction}'
                        ),
                        Spacer()
                      ],
                    ),
                    SizedBox(height: 8.0,),
                    Row(
                      children: <Widget>[
                        Spacer(),
                        Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20
                            ),
                            'Le ${financeActor.transactionModel_.amount}'
                        ),
                        Spacer()
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100.0,),
            Row(
              children: <Widget>[
                Text(
                  "Receiver's name",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Spacer(),
                Text(
                  '${financeActor.transactionModel_.receiverName}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              children: <Widget>[
                Text(
                  "Receiver's number",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Spacer(),
                Text(
                  '${financeActor.transactionModel_.receiverNumber}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              children: <Widget>[
                Text(
                  'Amount',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                  ),
                ),
                Spacer(),
                Text(
                  'Le ${financeActor.transactionModel_.amount}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              children: <Widget>[
                Text(
                  'Fee',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Spacer(),
                Text(
                  'Le 0.00',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Spacer(),
                Text(
                  'Le ${financeActor.transactionModel_.amount}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              children: <Widget>[
                Text(
                  'Date',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Spacer(),
                Text(
                    "${date_}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              children: <Widget>[
                Text(
                  'Status',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Spacer(),
                Text(
                  "${financeActor.transactionModel_.active == '2' ? 'Pending' : financeActor.transactionModel_.active == '3' ? 'Failed' : financeActor.transactionModel_.active == '1' ? 'Successful' : 'Failed'}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff3BFC75)
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              children: <Widget>[
                Text(
                  'Sender',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Spacer(),
                Text(
                  '${agentActor.agentModel_.agentNumber}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      // color: const Color(0xff3BFC75)
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.0,),
            Row(
              children: <Widget>[
                Spacer(),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    width: width*0.40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Share',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w200
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    // Navigator.pop(context);
                    // Navigator.pop(context);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => AccountsPage()),
                        ModalRoute.withName('/account') // Replace this with your root screen's route name (usually '/')
                    );
                  },
                  child: Container(
                    width: width*0.40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w200
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
