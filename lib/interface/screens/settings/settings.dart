import 'package:flutter/material.dart';
import 'package:payments/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();

                pref.remove("username");
                pref.remove("userid");

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                  return Login();
                }));
              },
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        )
      )
    );
  }
}
