import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shap_shap/Screens/3.sign_up_sc/controller/firebase_controller.dart';
import 'package:shap_shap/factory/color_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseController controller = Get.find<FirebaseController>();
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: () {
          controller.signUp();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorFactory.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.r,
              width: 20.r,
              child: SvgPicture.asset(ImagesFactory.account),
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: Text(
                'New Account',
                style: TextStyle(
                  color: ColorFactory.textPrimary,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
