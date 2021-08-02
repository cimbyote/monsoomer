import 'package:firebase_auth/firebase_auth.dart';
import 'package:monsoomer/models/media.dart';
import 'package:monsoomer/models/user_info_model.dart';
import 'package:monsoomer/services/database_service.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserInfoModel? _userInfoFromFirebaseUser(User? user)
  {
    return user != null ? UserInfoModel(uid: user.uid): null;
  }

  //auth change user stream
  //creates the custom data model
  Stream<UserInfoModel?> get user {
    return _auth.authStateChanges().map((User? user) => _userInfoFromFirebaseUser(user));  //same as above
    }

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

  Future registerWithEmailAndPassword(String email, String password) async
  {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //create a new document for user with the uid with dummy data


      await DatabaseService(uid: user!.uid).updateUserData(UserData());
      await DatabaseService(uid: user.uid).updateUserInfo(UserInfoModel(uid: user.uid));

      return _userInfoFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

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


  // //TODO: get userID
  // Stream<User?> get userId {
  //   return _auth.authStateChanges().uid;
  // }


}