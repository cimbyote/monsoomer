import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:monsoomer/models/media.dart';
import 'package:monsoomer/models/user_info_model.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  //collection reference, will automatically create it if it doesn't exist
  final CollectionReference userInfoCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference mediaCollection = FirebaseFirestore.instance.collection('userMediaCollections');


  Future updateUserInfo(UserInfoModel data) async {

    final temp = data.toJson();

    return await userInfoCollection.doc(uid).set(temp);
  }

  Future updateUserData(UserData data) async {

    final temp = data.toJson();

    return await mediaCollection.doc(uid).set(temp);
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {

    final temp1 = jsonEncode(snapshot.data());
    final temp2 = jsonDecode(temp1);

    return UserData.fromJson(temp2);
  }


  Stream<UserData> get userDataStream {
    return mediaCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }


  Future addToList(Media newMedia) async{

    mediaCollection.doc(uid).get().then((value) {
      if(value.exists)
      {
        final temp = jsonEncode(value.data());
        final temp2 = jsonDecode(temp);

        UserData theUserData = UserData.fromJson(temp2);

        theUserData.addMediaToList(newMedia);
        this.updateUserData(theUserData);
      }
    });

  }
}
