import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shap_shap/CoreModels/create_an_account_button/create_an_account_button.dart';
import 'package:shap_shap/CoreModels/sign_up_google_button/sign_up_google.dart';
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
              padding: EdgeInsets.only(top: 30.0.h),
              child: SvgPicture.asset(ImagesFactory.group),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 340.h,
            child: Container(
              padding: EdgeInsets.all(40.r),
              decoration: BoxDecoration(
                color: ColorFactory.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.r),
                  topRight: Radius.circular(60.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorFactory.secondaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    InputFieldWidget(
                      hintText: 'Name',
                      controller: TextEditingController(),
                      backgroundColor: ColorFactory.background,
                    ),
                    SizedBox(height: 25.h),
                    InputFieldWidget(
                      hintText: 'Email',
                      controller: TextEditingController(),
                      backgroundColor: ColorFactory.background,
                    ),
                    SizedBox(height: 25.h),
                    InputFieldWidget(
                      hintText: 'Password',
                      controller: TextEditingController(),
                      isPass: true,
                      backgroundColor: ColorFactory.background,
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      padding: EdgeInsets.only(left: 16.0.r),
                      child: RichText(
                        text: TextSpan(
                          text: 'Do you have account? ',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                color: ColorFactory.secondaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(("/signIn"));
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        Expanded(child: CreateAccountButton()),
                        SizedBox(width: 10.w),
                        Expanded(child: SignUpGoogleButton()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
