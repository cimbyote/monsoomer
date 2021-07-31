import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //TODO:sign in anon
  Future signInAnon() async
  {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }
    catch (e)
    {
      print(e.toString());
      return null;
    }
  }

  //TODO:sign in w/ email & password

  //TODO:register with email & password

  //TODO:sign out

  //TODO: get userID

}