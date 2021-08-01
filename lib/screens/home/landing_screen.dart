import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../widgets/rounded_square_button.dart';
import 'package:provider/provider.dart';
import 'package:monsoomer/managers/file_manager.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:monsoomer/services/auth_service.dart';

class LandingScreen extends StatelessWidget {
  static const String id = 'landing_screen';

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('images/tattoo.png', height: 100,),
                    Text(
                      'Monsoomer',
                      style: TextStyle(
                        // color: ActiveAppTheme.kActiveNegativeTextColor,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RoundedSquareButton(
              buttonText: '"Login"',
              textColor: Colors.white,
              onPressedCallback: () {
                //Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedSquareButton(
              buttonText: '"Register"',
              textColor: Colors.white,
              onPressedCallback: () {
                //Navigator.pushNamed(context, LoadingScreen.id);
              },
            ),

          ],
        ),
      ),
    );
  }
}
