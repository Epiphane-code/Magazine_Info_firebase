import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magazine_info/models/redacteur.dart';

class RedacteurRepository {
  final FirebaseFirestore _firestore;

  RedacteurRepository(this._firestore);

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('redacteurs');

  Future<List<Redacteur>> getRedacteurs() async {
    final snapshot = await _collection.get();

    return snapshot.docs.map((doc) => Redacteur.fromFirestore(doc)).toList();
  }

  Future<void> addRedacteur(Redacteur redacteur) async {
    print("depuis repositoryyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
    try {
      await _collection.add(redacteur.toFirestore()).timeout(Duration(seconds: 5));
    } catch (e) {
      print(
        "Erreurrrr $e depuis repositoryyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy",
      );

    }
  }

  Future<void> deleteRedacteur(String id) async {
    await _collection.doc(id).delete();
  }

  Future<void> upDateRedacteur(Redacteur redacteur) async {
    try{
      await _collection.doc(redacteur.id).update(redacteur.toFirestore());
    }
    catch(e){
      print(e);
    }
  }
}
