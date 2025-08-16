import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:shap_shap/backend/firebase_services.dart';

class FirebaseController extends GetxController {
  final FirebaseServices _firebaseServices = FirebaseServices();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  var isLoading = false.obs;
  var currentUser = Rxn<User>();

  // الرسائل: النوع والنص
  var alertMessage = Rxn<String>();
  var alertType = Rxn<ArtSweetAlertType>();

  @override
  void onInit() {
    super.onInit();
    _firebaseServices.authStateChanges.listen((user) {
      currentUser.value = user;

      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
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
      alertMessage.value = "Email or password is invalid";
      alertType.value = ArtSweetAlertType.danger;
      return;
    }
    isLoading.value = true;
    try {
      await _firebaseServices.signUp(email.text, password.text);
      alertMessage.value = "Your account has been created";
      alertType.value = ArtSweetAlertType.success;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          alertMessage.value = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          alertMessage.value = 'The account already exists for that email.';
          break;
        default:
          alertMessage.value = e.message ?? 'Unknown error';
      }
      alertType.value = ArtSweetAlertType.danger;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signIn() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      alertMessage.value = "Email or password is empty";
      alertType.value = ArtSweetAlertType.danger;
      return;
    }
    isLoading.value = true;
    try {
      await _firebaseServices.signIn(email.text, password.text);
      alertMessage.value = "Welcome back!";
      alertType.value = ArtSweetAlertType.success;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          alertMessage.value = 'No user found for that email.';
          break;
        case 'wrong-password':
          alertMessage.value = 'Wrong password provided for that user.';
          break;
        default:
          alertMessage.value = e.message ?? 'Unknown error';
      }
      alertType.value = ArtSweetAlertType.danger;
    } finally {
      isLoading.value = false;
    }
  }
}
