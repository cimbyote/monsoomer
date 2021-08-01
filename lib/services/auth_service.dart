import 'package:firebase_auth/firebase_auth.dart';
import 'package:monsoomer/models/user_info_model.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserInfoModel? _userInfoFromFirebaseUser(User? user)
  {
    return user != null ? UserInfoModel(uid: user.uid): null;
  }

  //auth change user stream
  //creates the custom data model
  Stream<User?> get user {
    return _auth.authStateChanges();
        //.map((User? user) => _userFromFirebaseUser(user));  //same as above
    }

  //TODO:sign in anon
  Future<UserInfoModel?> signInAnon() async
  {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userInfoFromFirebaseUser(user);
    }
    catch (e)
    {
      print(e.toString());
      return null;
    }
  }

  //TODO:sign in w/ email & password
  Future signInWithEmailAndPassword(String email, String password) async
  {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userInfoFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //TODO:register with email & password
  Future registerWithEmailAndPassword(String email, String password) async
  {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userInfoFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }


  //TODO:sign out
  Future signOut() async
  {
    try{
      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }


  //TODO: get userID

}