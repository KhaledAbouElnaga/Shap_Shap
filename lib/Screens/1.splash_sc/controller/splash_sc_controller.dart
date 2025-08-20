import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shap_shap/Screens/3.sign_up&in_screens/controller/sign_up_in_controller.dart';

class SplashScController extends GetxController {
  final SignUpInController controller = Get.find<SignUpInController>();
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

  void navigateToNextScreen() {
    if (controller.firebaseUser.value == null) {
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('/main_products_sc');
    }
  }
}
