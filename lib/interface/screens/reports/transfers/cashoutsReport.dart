import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:payments/index.dart';

class CashoutsReport extends StatefulWidget {
  const CashoutsReport({Key? key}) : super(key: key);

  @override
  State<CashoutsReport> createState() => _CashoutsReportState();
}

class _CashoutsReportState extends State<CashoutsReport> {
  List transfers = [];

  // fetch agent transfers
  Future fetchAgentTransfers() async {
    final agentActor = Provider.of<AgentActors>(context, listen: false);

    dynamic getAgentTransactionsIfExists = await ApiHelperFunctions.getAgentCashouts(agentId: agentActor.agentModel_.agentId!);

    debugPrint("Returned transfers is $getAgentTransactionsIfExists");
    // for(var transaction in getAgentTransactionsIfExists){
    //   // debugPrint("Service category is $serviceCat");
    //   financeActor.addTransaction(TransactionModel.fromJson(transaction));
    // }
    // debugPrint("Agent balance is $getAgentDetailsIfExists");
    // transfers = getAgentTransactionsIfExists;

    return getAgentTransactionsIfExists;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAgentTransfers();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final financeActor = Provider.of<FinanceActors>(context);
    final agentActor = Provider.of<AgentActors>(context);

    return Scaffold(
        appBar: AppBar(),
        body: Container(
          height: height,
          width: width,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
              children:[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Showing cashouts done by Agent ${agentActor.agentModel_.agentNumber}',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                    ),
                  ),
                ),
                FutureBuilder(
                    future: fetchAgentTransfers(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                      List<Widget> children;
                      if (snapshot.hasData) {
                        debugPrint("Snapshot has data ${snapshot.data}");
                        children = snapshot.data.reversed.map<Widget>((tx) {
                          debugPrint("Each is $tx");
                          var date_ = HelperFunctions.formatDrawDate(tx["DateCreated"]!);
                          return InkWell(
                            onTap: (){
                              // financeActor.updateRecentTransaction('TRANSFER');
                              //
                              // Navigator.pushNamed(
                              //   context,
                              //   '/invoice',
                              // );
                            },
                            child: Card(
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 15,
                                    ),
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(
                                    //     color: Color(0xff66b3ff),
                                    //     width: 1,
                                    //   ),
                                    // ),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '\Le ${tx["Amount"]}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Color(0xff5BADFC),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "CASHOUT",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        "${tx['StatusCode'] == 2000 ? 'Success' :
                                        tx['StatusCode'] == 2002 ? 'Pending' :
                                        'Failed'
                                        }",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.lightGreen.shade400
                                        ),
                                      ),
                                      Text(
                                        "${date_}",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 15,
                                    ),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff66b3ff),
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Bal Before',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        Text(
                                          '${tx["Receiving_balance_before"]}',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 15,
                                    ),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff66b3ff),
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Bal After',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        Text(
                                          '${tx["Receiving_balance_after"]}',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList();
                      } else if (snapshot.hasError) {
                        children = <Widget>[
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        ];
                      } else {
                        children = const <Widget>[
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Awaiting result...'),
                          ),
                        ];
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: children,
                        ),
                      );
                    }
                ),
              ]
          ),
        )
    );
  }
}
