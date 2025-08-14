import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Screens/1.splash_sc/controller/splash_sc_controller.dart';
import 'Screens/1.splash_sc/splash_sc.dart';
import 'testing_sc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // مهم جداً قبل أي Firebase.initializeApp
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.lazyPut(() => SplashScController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shap Shap',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/testing-screen', page: () => const TestingSc()),
      ],
    );
  }
}
