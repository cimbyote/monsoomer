import 'package:flutter/material.dart';
import 'package:monsoomer/services/auth_service.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            label: Text('Logout'),
            icon: Icon(Icons.person),
            onPressed: ()async{
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
