import 'package:app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  static final instance = FirebaseFirestore.instance;
  final userFirestore = instance.collection(userCollectionKey);

  Future<void> addUser({
    required String id,
    required String name,
    required String surname,
    required String email,
  }) async {
    try {
      await userFirestore.doc(id).set({
        'name': name,
        'surname': surname,
        'email': email,
      });
    } catch (e) {
      throw Exception('Failed to add user: $e');
    }
  }
}
