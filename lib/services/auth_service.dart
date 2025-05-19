import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth instance = FirebaseAuth.instance;

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  Future<UserCredential?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }

  Future signOut() async {
    try {
      await instance.signOut();
    } catch (e) {
      throw Exception('Failed to logout: $e');
    }
  }

  User? getCurrentUser() {
    return instance.currentUser;
  }
}
