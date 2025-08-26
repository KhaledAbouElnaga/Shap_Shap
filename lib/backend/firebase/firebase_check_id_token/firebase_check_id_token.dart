import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseCheckIdToken extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    _monitorAuthState();
  }

  // متابعة أي تغيير في حالة المستخدم
  void _monitorAuthState() {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        // المستخدم خرج أو تم حذفه
        Get.offAllNamed('/login'); // ارجع لصفحة تسجيل الدخول
      }
    });
  }

  // تحقق سريع عند أي Action مهم
  Future<void> checkUserDeleted() async {
    final user = _auth.currentUser;
    if (user != null) {
      try {
        await user.getIdToken(true); // يجبر Firebase على تحديث التوكن
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          await _auth.signOut();
          Get.offAllNamed('/login');
        }
      }
    }
  }
}
