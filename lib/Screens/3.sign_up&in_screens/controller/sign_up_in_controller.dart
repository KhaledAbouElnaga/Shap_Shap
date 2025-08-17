import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shap_shap/Screens/3.sign_up&in_screens/4.sign_in_sc/log_in_sc.dart';
import 'package:shap_shap/Screens/5.categories_sc/categories_sc.dart';

class SignUpInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();

  var isLoading = false.obs;
  var currentUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((user) {
      currentUser.value = user;
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        Get.snackbar(
          "Signed In",
          "User is currently signed in!",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  Future<void> signUp() async {
    if (email.text.isEmpty || password.text.length < 6) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          "Invalid Input",
          "Email is empty or password is too short.",
          snackPosition: SnackPosition.BOTTOM,
        );
      });
      return;
    }

    isLoading.value = true;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          "Sign Up Successful",
          "Your account has been created!",
          snackPosition: SnackPosition.BOTTOM,
        );
      });
      //
      //
      Future.delayed(Duration(seconds: 2), () {
        Get.offAll(() => LogInSc());
      });
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message ?? 'Unknown error occurred';
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          "Sign Up Error",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          "Error",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signIn() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar(
        "Invalid Input",
        "Email or password is empty.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Get.offAll(() => CategoriesSc());
      Get.snackbar(
        "Sign In Successful",
        "Welcome back!",
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.message ?? 'Unknown error occurred';
      }
      Get.snackbar(
        "Sign In Error",
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    Get.offAllNamed("/signUp");
    Get.snackbar(
      "Signed Out",
      "You have successfully signed out.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
