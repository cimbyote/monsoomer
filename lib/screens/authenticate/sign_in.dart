import 'package:flutter/material.dart';
import 'package:monsoomer/services/auth_service.dart';
import 'package:monsoomer/widgets/rounded_square_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, //gives dropshadow
        title: Text("Monsoomer Sign In"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: RoundedSquareButton(
          buttonText: 'Sign In Anonymously',
          onPressedCallback: () async
          {
            dynamic result = await _auth.signInAnon();
            if(result == null)
              {
                print("Error signing in anon");
              }
            else
              {
                print("User signed in");
                print(result);
              }
          },
        ),
      ),
    );
  }
}
