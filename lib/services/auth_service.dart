import 'package:app/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth instance = FirebaseAuth.instance;

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return 'User signed in successfully';
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String> signUp({
    required String email,
    required String password,
    required String surname,
    required String name,
  }) async {
    try {
      UserCredential userCredential = await instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await UserService().addUser(
        id: userCredential.user!.uid,
        name: name,
        surname: surname,
        email: email,
      );

      return 'User signed up successfully';
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String> signOut() async {
    try {
      await instance.signOut();
      return 'User signed out successfully';
    } catch (e) {
      throw Exception('Failed to logout: $e');
    }
  }
}
