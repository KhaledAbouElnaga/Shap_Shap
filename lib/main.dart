import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shap_shap/Screens/3.sign_up_sc/controller/firebase_controller.dart';
import 'package:shap_shap/Screens/3.sign_up_sc/sign_up_sc.dart';
import 'package:shap_shap/Screens/4.sign_in_sc/sign_in_sc.dart';
import 'package:shap_shap/Screens/5.categories_main_sc/main_sc.dart';
import 'package:shap_shap/factory/color_factory.dart';
import 'firebase_options.dart';
import 'Screens/1.splash_sc/controller/splash_sc_controller.dart';
import 'Screens/1.splash_sc/splash_sc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.lazyPut(() => SplashScController(), fenix: true);
  Get.put(FirebaseController());

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
        title: 'Shap Shap',
        theme: ThemeData(scaffoldBackgroundColor: ColorFactory.background),
        initialRoute: '/splash',
        getPages: [
          GetPage(name: '/splash', page: () => const SplashScreen()),
          GetPage(name: '/signUp', page: () => const SignUpSc()),
          GetPage(name: '/signIn', page: () => const SignInSc()),
          GetPage(name: '/main_screen', page: () => const MainSc()),
        ],
      ),
    );
  }
}
