import 'package:flutter/material.dart';

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
              Padding(
                  padding: EdgeInsets.all(20),
                child: Row(
                  children: [
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
              Divider(color: Color.fromRGBO(87, 86, 85, 0.82),),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
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
              Divider(color: Color.fromRGBO(87, 86, 85, 0.82),),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
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
