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
  final _formKey = GlobalKey<FormState>(); //used to track state of the form

  //text field state
  String _email = '';
  String _password = '';
  String _error = '';

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
          key: _formKey,
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
                validator: (val) => val!.isEmpty ? 'Enter an email': null,
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
                validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long': null,
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
                  if(_formKey.currentState!.validate()) //if the "validator" fields are null (null is good here)
                      {
                    dynamic result = await _auth.signInWithEmailAndPassword(_email, _password);
                    if(result == null)
                    {
                      setState(() {
                        _error = 'Could not sign in with those credentials.';
                      });
                    }
                    //NOTE: this will automatically take to home screen because of stream
                  }
                },
              ),
              SizedBox(
                height: 12,
              ),
              Text(_error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
