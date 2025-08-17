import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shap_shap/CoreModels/create_an_account_button/create_an_account_button.dart';
import 'package:shap_shap/CoreModels/sign_up_google_button/sign_up_google.dart';
import 'package:shap_shap/CoreModels/input_field_widget/input_field_widget.dart';
import 'package:shap_shap/Screens/3.sign_up&in_screens/controller/sign_up_in_controller.dart';
import 'package:shap_shap/Screens/3.sign_up&in_screens/4.sign_in_sc/sign_in_sc.dart';
import 'package:shap_shap/factory/color_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';

class SignUpSc extends StatefulWidget {
  const SignUpSc({super.key});

  @override
  State<SignUpSc> createState() => _SignUpScState();
}

class _SignUpScState extends State<SignUpSc> {
  final SignUpInController controller = Get.find<SignUpInController>();
  // final nameFocus = FocusNode();
  // final emailFocus = FocusNode();
  // final passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    // it navigates to the SignIn screen when the user is authenticated
    //from GetX
    ever(controller.currentUser, (user) {
      if (user != null) {
        Get.offAll(() => SignInSc());
      }
    });

    //   [nameFocus, emailFocus, passwordFocus].forEach((focusNode) {
    //     focusNode.addListener(() {
    //       if (!focusNode.hasFocus) {
    //         FocusScope.of(context).unfocus();
    //       }
    //     });
    //   });
    // }
  }

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
                            color: ColorFactory.textPrimary,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      InputFieldWidget(
                        hintText: 'Name',
                        controller: controller.name,
                        backgroundColor: ColorFactory.background,
                        image: ImagesFactory.person,
                        // focusNode: nameFocus,
                      ),
                      SizedBox(height: 25.h),
                      InputFieldWidget(
                        hintText: 'Email',
                        controller: controller.email,
                        // focusNode: emailFocus,
                        backgroundColor: ColorFactory.background,
                        image: ImagesFactory.email,
                      ),
                      SizedBox(height: 25.h),
                      InputFieldWidget(
                        hintText: 'Password',
                        controller: controller.password,
                        isPass: true,
                        backgroundColor: ColorFactory.background,
                        image: ImagesFactory.lock,
                        // focusNode: passwordFocus,
                      ),
                      SizedBox(height: 25.h),
                      Row(
                        children: [
                          Expanded(child: CreateAccountButton()),
                          SizedBox(width: 10.w),
                          Expanded(child: SignUpGoogleButton()),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        padding: EdgeInsets.only(left: 16.0.r),
                        child: RichText(
                          text: TextSpan(
                            text: 'Do you have an account? ',
                            style: TextStyle(
                              color: ColorFactory.black,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                  color: ColorFactory.textPrimary,
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
