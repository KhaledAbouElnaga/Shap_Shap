import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shap_shap/core_models/snack_bar/snack_bar_model.dart';
import 'package:shap_shap/factory/colors_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';
import 'package:shap_shap/screens/3.sign_up_in_screens/controller/sigin_in_up_controller.dart';
import 'package:shap_shap/screens/7.home_sc/home_sc.dart';

class LogInButton extends StatelessWidget {
  final String buttonName;
  const LogInButton({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    final SignUpInController controller = Get.find<SignUpInController>();
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          controller.errorCode.value = '';
          controller.errorMessage.value = '';
          await controller.signIn();
          if (controller.errorCode.value.isNotEmpty) {
            String message;
            switch (controller.errorCode.value) {
              case 'user-not-found':
                message = "No user found for this Email.";
                break;
              case 'wrong-password':
                message = "The password is incorrect. Please try again.";
                break;
              case 'invalid-email':
                message = "The email address is not valid.";
                break;
              case 'user-disabled':
                message = "This user account has been disabled.";
                break;
              case 'too-many-requests':
                message = "Too many attempts. Please try again later.";
                break;
              default:
                message = "Something went wrong. Please try again.";
            }
            SnackBarModel.show(
              title: "Error⚠️",
              message: message,
              type: SnackType.error,
              duration: const Duration(seconds: 4),
            );
          } else {
            SnackBarModel.show(
              title: "Success✅",
              message: "Logged in successfully!",
              type: SnackType.success,
              duration: const Duration(seconds: 2),
            );
            await Future.delayed(const Duration(seconds: 1));
            Get.offAll(() => const HomeSc());
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
