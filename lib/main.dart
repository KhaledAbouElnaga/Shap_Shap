import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shap_shap/backend/firebase/firebase_storage/firebase_storage_controller.dart';
import 'package:shap_shap/screens/3.sign_up_in_screens/6.forgot_password_sc/forgot_password_sc.dart';
import 'package:shap_shap/screens/3.sign_up_in_screens/controller/sigin_in_up_controller.dart';
import 'package:shap_shap/screens/3.sign_up_in_screens/5.sign_up_sc/sign_up_sc.dart';
import 'package:shap_shap/screens/3.sign_up_in_screens/4.login_sc/login_sc.dart';
import 'package:shap_shap/testing.dart';
import 'package:shap_shap/screens/7.main_products_sc/main_products_sc.dart';
import 'package:shap_shap/factory/colors_factory.dart';
import 'firebase_options.dart';
import 'screens/1.splash_sc/controller/splash_sc_controller.dart';
import 'screens/1.splash_sc/splash_sc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.lazyPut(() => SplashScController(), fenix: true);
  Get.put(SignUpInController());
  Get.put(FirebaseStorageController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final logicalSize = MediaQuery.of(context).size;
    // print('Logical screen width: ${logicalSize.width}');
    // print('Logical screen height: ${logicalSize.height}');
    return ScreenUtilInit(
      designSize: const Size(420, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shup Shup',
        theme: ThemeData(scaffoldBackgroundColor: ColorsFactory.background),
        initialRoute: '/main_products_sc',
        getPages: [
          GetPage(name: '/splash', page: () => const SplashScreen()),
          GetPage(name: '/signUp', page: () => const SignUpSc()),
          GetPage(name: '/login', page: () => const LoginSc()),
          GetPage(
            name: '/forgot_password_sc',
            page: () => const ForgotPasswordSc(),
          ),
          GetPage(
            name: '/main_products_sc',
            page: () => const MainProductsSc(),
          ),

          GetPage(name: '/testing', page: () => Testing()),
        ],
      ),
    );
  }
}
