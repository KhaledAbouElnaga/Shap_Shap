import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shap_shap/backend/firebase/firebase_check_id_token/firebase_check_id_token.dart';
import 'package:shap_shap/screens/3.sign_up_in_screens/controller/sigin_in_up_controller.dart';

class SplashScController extends GetxController {
  final SignUpInController controller = Get.find<SignUpInController>();
  final FirebaseCheckIdToken checkIdToken = Get.find<FirebaseCheckIdToken>();
  final machineName = 'State Machine 1';
  final artboardName = 'c_36 (1)';
  final splashScDuration = Duration(seconds: 3);

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

  void navigateToNextScreen() async {
    await checkIdToken.checkUserDeleted();
    if (controller.firebaseUser.value == null) {
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('/home_sc');
    }
  }
}
