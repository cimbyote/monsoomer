import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:monsoomer/models/media_model.dart';
import 'package:monsoomer/models/user_info_model.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  //collection reference, will automatically create it if it doesn't exist
  final CollectionReference mediaCollection = FirebaseFirestore.instance.collection('userData');

  Future updateUserData(String name, String type) async {
    return await mediaCollection.doc(uid).set({
      'name': name,
      'type': type,
    });
  }


  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      media: Media(
        name: snapshot.get('name'),
        type: snapshot.get('type'),
      ),
    );
  }


  Stream<UserData> get userDataStream {
    return mediaCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
