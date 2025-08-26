import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shap_shap/core_models/buttons/loge_in_button/log_in_button.dart';
import 'package:shap_shap/core_models/buttons/sign_up_google_button/sign_up_google.dart';
import 'package:shap_shap/core_models/input_field_widget/input_field_widget.dart';
import 'package:shap_shap/factory/colors_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';
import 'package:shap_shap/screens/3.sign_up_in_screens/controller/sigin_in_up_controller.dart';

class LoginSc extends StatefulWidget {
  const LoginSc({super.key});

  @override
  State<LoginSc> createState() => _LoginScState();
}

class _LoginScState extends State<LoginSc> {
  final SignUpInController controller = Get.find<SignUpInController>();

  @override
  void initState() {
    super.initState();
    controller.emailController.clear();
    controller.passwordController.clear();
  }
  // final nameFocus = FocusNode();
  // final emailFocus = FocusNode();
  // final passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                  color: ColorsFactory.white,
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
                          "Log In",
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorsFactory.primary,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),

                      InputFieldWidget(
                        hintText: 'Email',
                        controller: controller.emailController,
                        textInputType: TextInputType.emailAddress,
                        // focusNode: emailFocus,
                        backgroundColor: ColorsFactory.background,
                        image: ImagesFactory.email,
                      ),
                      SizedBox(height: 25.h),
                      InputFieldWidget(
                        hintText: 'Password',
                        controller: controller.passwordController,
                        textInputType: TextInputType.visiblePassword,
                        isPass: true,
                        backgroundColor: ColorsFactory.background,
                        image: ImagesFactory.lock,
                        // focusNode: passwordFocus,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            controller.emailController.clear();
                            controller.passwordController.clear();
                            Get.toNamed(("/forgot_password_sc"));
                          },
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(color: ColorsFactory.textPrimery),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150.w,
                            child: LogInButton(buttonName: 'Sign In'),
                          ),
                          SizedBox(width: 10.w),
                          SizedBox(width: 150.w, child: SignUpGoogleButton()),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Container(
                        padding: EdgeInsets.only(left: 10.0.r),
                        child: RichText(
                          text: TextSpan(
                            text: 'Don\'t you have an account? ',
                            style: TextStyle(
                              color: ColorsFactory.black,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign up',
                                style: TextStyle(color: ColorsFactory.primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    controller.emailController.clear();
                                    controller.passwordController.clear();
                                    Get.toNamed(("/signUp"));
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
