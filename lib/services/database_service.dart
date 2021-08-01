import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({required this.uid});

  //collection reference, will automatically create it if it doesn't exist
  final CollectionReference monsterCollection = FirebaseFirestore.instance.collection('monster');

  Future updateUserData(String name, String type, int number) async
  {
    return await monsterCollection.doc(uid).set({
      'name': name,
      'type' : type,
      'number': number,
    });

  }
}