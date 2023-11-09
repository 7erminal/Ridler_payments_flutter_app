import 'package:flutter/material.dart';
import 'package:payments/infrastructure/actors/agent_actors.dart';
import 'package:payments/infrastructure/models/agent_model.dart';
import 'package:payments/interface/screens/accounts/accounts.dart';
import 'package:payments/index.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {

    final agent_actor = Provider.of<AgentActors>(context, listen: true);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool showError = false;

    return Scaffold(
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xff66b3ff), const Color(0xff808081)]
            )
          ),
          child: Center(
            child: Container(
              height: height/2,
              width: width-20,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter Number",
                          labelText: "Number"
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "please enter number";
                        }
                        return null;
                      },
                      controller: usernameController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password"
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "please enter password";
                          }
                          return null;
                        },
                        controller: passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                      ),
                    ),
                    if (showError == true)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Username/Password incorrect or do not exist',
                          style: TextStyle(
                            fontSize: 10,
                            color: const Color(0xffFB6916)
                          )
                        )
                      ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          primary: Colors.white,
                          fixedSize: Size(95, 6),
                          backgroundColor: const Color(0xff66b3ff),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            context.loaderOverlay.show();

                            dynamic getAgentDetailsIfExists = await ApiHelperFunctions
                                .validateCredentials(username: usernameController
                                .text.trim(), password: passwordController.text.trim());

                            debugPrint(
                                "data returned after credentials vaidation...");
                            debugPrint("$getAgentDetailsIfExists");
                            // debugPrint("${getAgentDetailsIfExists['AgentId']}");

                            context.loaderOverlay.hide();

                            if (getAgentDetailsIfExists != null &&
                                getAgentDetailsIfExists.runtimeType != String) {
                              agent_actor.updateAgent(AgentModel.fromJson(
                                  getAgentDetailsIfExists));

                              debugPrint("Agent name is ${agent_actor.agentModel_
                                  .username}");

                              // context.loaderOverlay.hide();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccountsPage()),
                              );
                            } else {
                              setState(() {
                                showError = true;
                              });
                            }
                          }
                        },
                        child: Text('Login'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
