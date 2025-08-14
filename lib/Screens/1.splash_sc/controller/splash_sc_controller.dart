import 'package:get/get.dart';
import 'package:rive/rive.dart';

class SplashScController extends GetxController {
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
    } else {
      _navigated = true;
      Get.offAllNamed('/testing-screen');
    }
  }
}
