import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user.dart';

class FireStoreUserService {
  final CollectionReference<Map<String, dynamic>> _usersCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel user) async {
    await _usersCollectionRef.doc(user.id).set(user.toJson());
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getCurrentuser(
      String uid) async {
    var value = await _usersCollectionRef.doc(uid).get();
    return value;
  }
}
