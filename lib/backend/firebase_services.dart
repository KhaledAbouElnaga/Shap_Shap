import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseServices extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signUp(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signIn(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  // follows if the user is logged in or not
  // it is a stream because it emits events whenever the authentication state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
