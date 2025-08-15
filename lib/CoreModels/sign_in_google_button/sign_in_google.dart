import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shap_shap/factory/color_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';

class SignInGoogleButton extends StatelessWidget {
  const SignInGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: () async {},
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
                color: ColorFactory.secondaryColor,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
