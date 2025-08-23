import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shap_shap/core_models/buttons/reset_password_buttton/reset_password_button.dart';
import 'package:shap_shap/core_models/input_field_widget/input_field_widget.dart';
import 'package:shap_shap/factory/color_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';
import 'package:shap_shap/screens/3.sign_up_in_screens/4.login_sc/login_sc.dart';

class ForgotPasswordSc extends StatelessWidget {
  const ForgotPasswordSc({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    SvgPicture.asset(
                      ImagesFactory.forgotPassword,
                      width: 300.w,
                    ),
                    SizedBox(height: 40.h),
                    InputFieldWidget(
                      hintText: 'Email Address',
                      controller: emailController,
                      backgroundColor: ColorsFactory.searchBarColor,
                      textInputType: TextInputType.emailAddress,
                      image: ImagesFactory.email,
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0.r),
                      child: SizedBox(
                        width: double.infinity,
                        child: RichText(
                          text: TextSpan(
                            text: 'Remember the password? ',
                            style: TextStyle(
                              color: ColorsFactory.black,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(color: ColorsFactory.primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    emailController.clear();
                                    Get.offAll(() => LoginSc());
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    SizedBox(
                      width: 170.w,
                      child: ResetPasswordButton(
                        buttonName: 'Reset Password',
                        emailController: emailController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
