import 'package:app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  static final instance = FirebaseFirestore.instance;
  final userFirestore = instance.collection(userCollectionKey);

  addUser({required String id, required Map<String, dynamic> data}) {
    userFirestore.doc(id).set(data);
  }
}
