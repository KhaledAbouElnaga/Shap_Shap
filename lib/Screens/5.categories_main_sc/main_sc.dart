import 'package:flutter/material.dart';
import 'package:shap_shap/Screens/3.sign_up_sc/controller/firebase_controller.dart';
import 'package:get/get.dart';

class MainSc extends StatelessWidget {
  const MainSc({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseController firebaseController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.login_outlined),
            onPressed: () {
              firebaseController.signOut();
            },
          ),
        ],
      ),
      body: Center(child: Text('Categories will be displayed here')),
    );
  }
}
