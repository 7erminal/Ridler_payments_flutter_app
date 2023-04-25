import 'package:flutter/material.dart';
import 'package:payments/index.dart';
import 'package:payments/infrastructure/actors/agent_actors.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Transaction {
  final String title;
  final double amount;
  final String entity;
  final DateTime date;

  Transaction({required this.title, required this.entity, required this.amount, required this.date});
}

class AccountsPage extends StatefulWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  void initState(){
    fetchBalanceAndRecentTransactions();
  }

  // fetch transactions and balance
  fetchBalanceAndRecentTransactions() async {
    final agentActor = Provider.of<AgentActors>(context, listen: false);
    final financeActor = Provider.of<FinanceActors>(context, listen: false);
    dynamic getAgentDetailsIfExists = await ApiHelperFunctions.getAgentBalance(agentId: agentActor.agentModel_.agentId!);
    dynamic getAgentTransactionsIfExists = await ApiHelperFunctions.getAgentTransactions(agentId: agentActor.agentModel_.agentId!);

    agentActor.updateBalance(getAgentDetailsIfExists['Balance'].toString());

    debugPrint("Agent transactions are $getAgentTransactionsIfExists");

    financeActor.transactions.clear();
    for(var transaction in getAgentTransactionsIfExists){
      // debugPrint("Service category is $serviceCat");
      financeActor.addTransaction(TransactionModel.fromJson(transaction));
    }
    debugPrint("Agent balance is $getAgentDetailsIfExists");
  }

  // final List<Transaction> transactions = [
  //   Transaction(
  //     title: 'Transfer',
  //     entity: 'Branch 02',
  //     amount: 55.25,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     title: 'Cash out',
  //     entity: 'Branch 02',
  //     amount: 30.10,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     title: 'Transfer',
  //     entity: 'Branch 02',
  //     amount: 70.00,
  //     date: DateTime.now(),
  //   ),
  // ];

  Widget build(BuildContext context) {
    final agentActor = Provider.of<AgentActors>(context);
    final financeActor = Provider.of<FinanceActors>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        // height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: height*0.4,
                    width: width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [const Color(0xff66b3ff), const Color(0xff9f9ffc)]
                          )
                      ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            width: width,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Spacer(),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Settings()),
                                    );
                                  },
                                  child: Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 45),
                            child: Row(
                              children: [
                                Text(
                                  'float',
                                  style: GoogleFonts.quicksand(
                                    textStyle: TextStyle(
                                        fontSize: 112,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xffAFD7FE),
                                        letterSpacing: .5
                                    ),
                                  )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Text(
                  "Transactions",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black26
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SendMoney()),
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
                              'Transfer Money',
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cashout()),
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
                            'Cash Out',
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
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Row(
                children: <Widget>[
                  Spacer(),
                  Container(
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
                          'Statement',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w200
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Reports()),
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
                            'Reports',
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
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Text(
                    "Recent Activity",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black26
                  ),
                ),
              ),
              financeActor.transactions != null ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:
                financeActor.transactions.reversed.map((tx) {
                  var date_ = HelperFunctions.formatDrawDate(tx.transactionDate!);
                  return InkWell(
                    onTap: (){
                      tx.transactionType == '1' ? financeActor.updateRecentTransaction('TRANSFER') :
                      tx.transactionType == '2' ? financeActor.updateRecentTransaction('CASHOUT') :
                      tx.transactionType == '3' ? financeActor.updateRecentTransaction('DEPOSIT') :
                      financeActor.updateRecentTransaction('');

                      financeActor.updateTransaction(tx);

                      Navigator.pushNamed(
                        context,
                        '/invoice',
                      );
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff66b3ff),
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '\Le ${tx.amount}',
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
                                "${tx.transactionType.toString() == '1' ? 'TRANSFER'
                                    : tx.transactionType.toString() == '2' ? 'CASHOUT'
                                    : tx.transactionType.toString() == '3' ? 'DEPOSIT'
                                    : ''}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Branch ${tx.sendingBranchId.toString()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "$date_",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Success',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.lightGreen.shade400
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList()
              )
                  :
              Text(
                'No transactions performed',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200
                ),
              ),
                ],
              ),
              Positioned(
                top: height*0.33,
                // right: 40,
                child: Container(
                  width: width,
                  child: Row(
                    children: [
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(20),
                        height: 100,
                        width: width-30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                              "Le ${agentActor.balance != 'null' || agentActor.balance != '' ? agentActor.balance : '0'}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 28,
                                    color: Colors.black54
                                  )
                          ),
                        ),
                      ),
                      Spacer(),
                  ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
