import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignUpInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Reactive user object
  Rx<User?> firebaseUser = Rx<User?>(null);

  // Reactive loading & error state
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var errorCode = ''.obs;

  // TextEditingControllers for email & password
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  // to read if the user is logged in or not( to use in if methods )
  bool get isLoggedIn => firebaseUser.value != null;

  @override
  void onInit() {
    super.onInit();
    // a method to follows the user state if changes (loged in or not)
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Sign Up method
  Future<void> signUp() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      nameController.clear();
      emailController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? '';
      errorCode.value = e.code;
    } finally {
      isLoading.value = false;
    }
  }

  // Sign In method
  Future<void> signIn() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? '';
      errorCode.value = e.code;
    } finally {
      isLoading.value = false;
    }
  }

  // Sign Out method
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
