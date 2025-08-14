import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:shap_shap/Screens/1.splash_sc/controller/splash_sc_controller.dart';
import 'package:shap_shap/factory/color_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScController controller = Get.find();
    return Scaffold(
      backgroundColor: ColorFactory.primaryColor,
      body: SafeArea(
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: RiveAnimation.asset(
              ImagesFactory.splashScreenRiveAnimation,
              artboard: controller.artboardName,
              stateMachines: [controller.machineName],
              onInit: controller.riveOnInit,
            ),
          ),
        ),
      ),
    );
  }
}
