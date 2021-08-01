import 'package:flutter/material.dart';
import 'package:monsoomer/models/user_info_model.dart';


import 'package:monsoomer/screens/authenticate/authenticate.dart';
import 'package:monsoomer/screens/home/home.dart';


import '../../widgets/rounded_square_button.dart';
import 'package:provider/provider.dart';
import 'package:monsoomer/managers/file_manager.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:monsoomer/services/auth_service.dart';

class Wrapper extends StatelessWidget {
  static const String id = 'wrapper';


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserInfoModel?>(context);

    if(user == null)
      {
        return Authenticate();
      }
    else{
      return Home();
    }
  }
}
