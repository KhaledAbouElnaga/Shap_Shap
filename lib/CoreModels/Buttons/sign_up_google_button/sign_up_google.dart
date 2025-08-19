import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shap_shap/CoreModels/SnackBar/snack_bar_model.dart';
import 'package:shap_shap/Screens/3.sign_up&in_screens/controller/sign_up_in_controller.dart';
import 'package:shap_shap/Screens/5.categories_sc/categories_sc.dart';
import 'package:shap_shap/factory/color_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';

class SignUpGoogleButton extends StatelessWidget {
  const SignUpGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpInController>();
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: () async {
          try {
            await controller.signInWithGoogle();
            SnackBarModel.show(
              title: "Success✅",
              message: "Signed in successfully",
              type: SnackType.success,
              duration: const Duration(seconds: 2),
            );
            Get.offAll(() => const CategoriesSc());
          } catch (e) {
            SnackBarModel.show(
              title: "Error⚠️",
              message: "Failed to sign in: $e",
              type: SnackType.error,
              duration: const Duration(seconds: 4),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorFactory.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 20.r,
              width: 20.r,
              child: SvgPicture.asset(ImagesFactory.google),
            ),
            SizedBox(width: 10.w),
            Text(
              'Google',
              style: TextStyle(
                color: ColorFactory.textPrimary,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
