import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;
  bool isGoogleInitialized = false;

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

  // Initialize Google Sign-In
  Future<void> _initGoogleSignIn() async {
    if (!isGoogleInitialized) {
      await googleSignIn.initialize(
        clientId:
            "1041806689164-lc111sn77bjapn19hmkddt7fhaidcnp9.apps.googleusercontent.com",
      );
    }
    isGoogleInitialized = true;
  }

  // Sign in with Google method
  Future<UserCredential> signInWithGoogle() async {
    try {
      await _initGoogleSignIn();

      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();
      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      }

      final idToken = googleUser.authentication.idToken;
      final authClient = googleUser.authorizationClient;

      GoogleSignInClientAuthorization? auth = await authClient
          .authorizationForScopes(['email', 'profile']);

      final accessToken = auth?.accessToken;
      if (accessToken == null) {
        final fallbackAuth = await authClient.authorizationForScopes([
          'email',
          'profile',
        ]);

        if (fallbackAuth?.accessToken == null) {
          throw FirebaseAuthException(
            code: 'ERROR_MISSING_ACCESS_TOKEN',
            message: 'Missing access token from Google Sign-In',
          );
        }
        auth = fallbackAuth;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: auth?.accessToken,
        idToken: idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.code} - ${e.message}");
      rethrow;
    } catch (e) {
      print("Unexpected error during Google Sign-In: $e");
      rethrow;
    }
  }

  // Sign out with Google method
  Future<void> signOutWithGoogle() async {
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
