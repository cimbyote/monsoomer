import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:monsoomer/models/monster.dart';
import 'package:monsoomer/models/user_info_model.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  //collection reference, will automatically create it if it doesn't exist
  final CollectionReference monsterCollection =
      FirebaseFirestore.instance.collection('monster');

  Future updateUserData(String name, String type, int number) async {
    return await monsterCollection.doc(uid).set({
      'name': name,
      'type': type,
      'number': number,
    });
  }

  //monster list from snapshot
  List<Monster> _monsterListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Monster(
        name: doc.get('name') ?? '',
        type: doc.get('type') ?? '',
        number: doc.get('number') ?? 0,
      );
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      monster: Monster(
        name: snapshot.get('name'),
        type: snapshot.get('type'),
        number: snapshot.get('number'),
      ),
    );
  }

  //get monster stream
  Stream<List<Monster>> get monsters {
    return monsterCollection.snapshots().map(_monsterListFromSnapshot);
  }

  Stream<UserData> get userDataStream {
    return monsterCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
