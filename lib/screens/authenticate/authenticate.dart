import 'package:flutter/material.dart';
import 'package:monsoomer/screens/authenticate/register.dart';
import 'package:monsoomer/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  static const String id = 'authenticate_screen';

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView()
  {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn)
      {
        return SignIn(toggleViewCallback: toggleView);
      }
    else{
      return Register(toggleViewCallback: toggleView);
    }
  }
}
