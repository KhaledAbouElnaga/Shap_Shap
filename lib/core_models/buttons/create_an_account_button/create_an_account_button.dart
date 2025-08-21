import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shap_shap/core_models/snack_bar/snack_bar_model.dart';
import 'package:shap_shap/factory/color_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';
import 'package:shap_shap/screens/3.sign_up_in_screens/controller/sigin_in_up_controller.dart';

class CreateAccountButton extends StatelessWidget {
  final String buttonName;
  const CreateAccountButton({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    final SignUpInController controller = Get.find<SignUpInController>();
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          await controller.signUp();
          // ignore: unrelated_type_equality_checks
          if (controller.errorCode.value == 'weak-password') {
            SnackBarModel.show(
              title: "Error⚠️",
              message: "Password is too weak",
              type: SnackType.error,
              duration: const Duration(seconds: 4),
            );
            // ignore: unrelated_type_equality_checks
          } else if (controller.errorCode.value == 'email-already-in-use') {
            SnackBarModel.show(
              title: "Error⚠️",
              message: "Email is already in use",
              type: SnackType.error,
              duration: const Duration(seconds: 4),
            );
          } else if (controller.errorCode.isEmpty) {
            SnackBarModel.show(
              title: "Success✅",
              message: "Account created successfully!",
              type: SnackType.success,
              duration: const Duration(seconds: 2),
            );
            Get.offAllNamed("/login");
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorFactory.background,
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
