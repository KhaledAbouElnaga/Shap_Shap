import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shap_shap/backend/firebase/firebase_storage/firebase_storage_controller.dart';
import 'package:shap_shap/factory/colors_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';
import 'package:shap_shap/screens/7.main_products_sc/model/categories/categories_model.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseStorageController controller =
        Get.find<FirebaseStorageController>();
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(color: ColorsFactory.primary),
        );
      }
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.someCategoiesList.length,
        itemBuilder: (context, index) {
          final cagegory = controller.someCategoiesList[index];
          return Padding(
            padding: EdgeInsets.all(6.0.r),
            child: GestureDetector(
              onTap: () => {print("testing")},
              child: CategoriesModel(
                name: cagegory['name'] ?? "An Eroor to Find The Product",
                image: cagegory['image'] ?? ImagesFactory.notFound,
              ),
            ),
          );
        },
      );
    });
  }
}
