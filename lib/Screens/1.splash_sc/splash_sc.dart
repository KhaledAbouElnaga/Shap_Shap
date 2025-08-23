import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart' hide Image;
import 'package:shap_shap/screens/1.splash_sc/controller/splash_sc_controller.dart';
import 'package:shap_shap/factory/colors_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScController controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 150.0.r),
                child: Text(
                  "Welcome to Shup Shup",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsFactory.primary,
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
