import 'package:flutter/material.dart';
import 'package:monsoomer/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  static const String id = 'authenticate_screen';

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
}
