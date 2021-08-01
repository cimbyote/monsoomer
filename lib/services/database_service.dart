import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monsoomer/models/monster.dart';

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

  //monster list from snapshot
  List<Monster> _monsterListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return Monster(
        name: doc.get('name') ?? '',
        type: doc.get('type') ?? '',
        number: doc.get('number') ?? 0,
      );
    }).toList();
  }

  //get monster stream
  Stream<List<Monster>> get monsters {
    return monsterCollection.snapshots().map(_monsterListFromSnapshot);
  }
}