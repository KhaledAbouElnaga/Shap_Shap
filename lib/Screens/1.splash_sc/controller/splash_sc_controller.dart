import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shap_shap/Screens/3.sign_up_sc/controller/firebase_controller.dart';

class SplashScController extends GetxController {
  final FirebaseController firebaseController = Get.find<FirebaseController>();
  final machineName = 'State Machine 1';
  final artboardName = 'c_36 (1)';
  final splashScDuration = Duration(seconds: 3);
  bool _navigated = false;

  void riveOnInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      machineName,
    );
    if (controller != null) {
      artboard.addController(controller);
    }

    Future.delayed(splashScDuration, navigateToNextScreen);
  }

  void navigateToNextScreen() {
    if (_navigated) {
      return;
    } else if (firebaseController.currentUser.value == null) {
      _navigated = true;
      Get.offAllNamed('/signUp');
    } else if (firebaseController.currentUser.value != null) {
      _navigated = true;
      Get.offAllNamed('/main_screen');
    }
  }
}
