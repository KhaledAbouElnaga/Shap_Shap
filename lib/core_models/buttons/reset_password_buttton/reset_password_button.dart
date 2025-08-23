import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shap_shap/core_models/snack_bar/snack_bar_model.dart';
import 'package:shap_shap/factory/color_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';
import 'package:shap_shap/screens/3.sign_up_in_screens/4.login_sc/login_sc.dart';

class ResetPasswordButton extends StatelessWidget {
  final String buttonName;
  final TextEditingController emailController;
  const ResetPasswordButton({
    super.key,
    required this.buttonName,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          try {
            if (emailController.text.isEmpty) {
              SnackBarModel.show(
                title: "Error❌",
                message: "Email field cannot be empty.",
                type: SnackType.error,
                duration: const Duration(seconds: 2),
              );
              return;
            }
            FirebaseAuth.instance.sendPasswordResetEmail(
              email: emailController.text.trim(),
            );
            SnackBarModel.show(
              title: "Success✅",
              message: "Go to check your Email!",
              type: SnackType.success,
              duration: const Duration(seconds: 2),
            );
            Get.offAll(() => LoginSc());
          } catch (e) {
            SnackBarModel.show(
              title: "Error❌",
              message: "Failed $e.",
              type: SnackType.error,
              duration: const Duration(seconds: 4),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsFactory.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.r,
              width: 20.r,
              child: SvgPicture.asset(ImagesFactory.account),
            ),
            SizedBox(width: 8.w),
            Text(
              buttonName,
              style: TextStyle(color: ColorsFactory.primary, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
