import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart' hide Image;
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
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Text(
                  "Welcome to Shap Shap",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: ColorFactory.secondaryColor,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            RiveAnimation.asset(
              ImagesFactory.splashScreenRiveAnimation,
              artboard: controller.artboardName,
              stateMachines: [controller.machineName],
              onInit: controller.riveOnInit,
            ),
          ],
        ),
      ),
    );
  }
}
