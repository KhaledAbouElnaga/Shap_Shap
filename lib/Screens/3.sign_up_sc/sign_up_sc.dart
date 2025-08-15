import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shap_shap/CoreModels/create_an_account_button/create_an_account_button.dart';
import 'package:shap_shap/CoreModels/sign_in_google_button/sign_in_google.dart';
import 'package:shap_shap/CoreModels/input_field_widget/input_field_widget.dart';
import 'package:shap_shap/factory/color_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';

class SignUpSc extends StatelessWidget {
  const SignUpSc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 60.0.r),
              child: SvgPicture.asset(ImagesFactory.group),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 400,
            child: Container(
              padding: EdgeInsets.all(40.r),
              decoration: BoxDecoration(
                color: ColorFactory.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.r),
                  topRight: Radius.circular(60.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorFactory.secondaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  InputFieldWidget(
                    hintText: 'Name',
                    controller: TextEditingController(),
                    backgroundColor: ColorFactory.background,
                  ),
                  SizedBox(height: 20.h),
                  InputFieldWidget(
                    hintText: 'Email',
                    controller: TextEditingController(),
                    backgroundColor: ColorFactory.background,
                  ),
                  SizedBox(height: 20.h),
                  InputFieldWidget(
                    hintText: 'Password',
                    controller: TextEditingController(),
                    isPass: true,
                    backgroundColor: ColorFactory.background,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(child: CreateAccountButton()),
                      SizedBox(width: 10.w),
                      Expanded(child: SignInGoogleButton()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
