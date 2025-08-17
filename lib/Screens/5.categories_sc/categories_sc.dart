import 'package:flutter/material.dart';
import 'package:shap_shap/Screens/3.sign_up&in_screens/controller/sign_up_in_controller.dart';
import 'package:get/get.dart';

class CategoriesSc extends StatelessWidget {
  const CategoriesSc({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpInController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.login_outlined),
            onPressed: () {
              controller.signOut();
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
      body: Center(child: Text('Categories will be displayed here')),
    );
  }
}
