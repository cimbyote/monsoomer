import 'package:flutter/material.dart';
import 'package:monsoomer/services/auth_service.dart';
import 'package:monsoomer/widgets/rounded_square_button.dart';

class SignIn extends StatefulWidget {

  final Function toggleViewCallback;
  SignIn({required this.toggleViewCallback});


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  //text field state
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, //removes drop shadow
        title: Text("Monsoomer Sign In"),
        actions: <Widget>[
          TextButton.icon(
            label: Text('Register'),
            icon: Icon(Icons.person),
            onPressed: () {
              widget.toggleViewCallback();
            },
          ),
        ],
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade700,
                ),
                onChanged: (value) {
                  setState(() => _email = value); //same thing just shorter
                  // setState(() {
                  //   email = value;
                  // });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade700,
                ),
                onChanged: (value) {
                  setState(() => _password = value);
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundedSquareButton(
                buttonText: 'Login',
                textColor: Colors.white,
                onPressedCallback: () async{
                  print(_email);
                  print(_password);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}