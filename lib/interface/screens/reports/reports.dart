import 'package:flutter/material.dart';
import 'package:payments/index.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: height,
        width: width,
        child: Card(
          child: ListView(
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransfersReport()),
                  );
                },
                child: Padding(
                    padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_post_office_outlined
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        'Transfers',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: const Color(0xff797D7F),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: Color.fromRGBO(87, 86, 85, 0.82),),
              InkWell(
                // onTap: (){
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => CashoutsReport()),
                //   );
                // },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(
                          Icons.add
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        'Deposits',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w200
                        ),
                      ),
                      Spacer(),
                      Icon(
                          Icons.arrow_forward_ios_sharp,
                        color: const Color(0xff797D7F),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: Color.fromRGBO(87, 86, 85, 0.82),),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CashoutsReport()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(
                          Icons.money
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        'Cash outs',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w200
                        ),
                      ),
                      Spacer(),
                      Icon(
                          Icons.arrow_forward_ios_sharp,
                        color: const Color(0xff797D7F),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: Color.fromRGBO(87, 86, 85, 0.82),),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      'General',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200
                      ),
                    ),
                    Spacer(),
                    Icon(
                        Icons.arrow_forward_ios_sharp,
                      color: const Color(0xff797D7F),
                    )
                  ],
                ),
              ),
              Divider(color: Color.fromRGBO(87, 86, 85, 0.82),),
            ],
          ),
        ),
      ),
    );
  }
}
