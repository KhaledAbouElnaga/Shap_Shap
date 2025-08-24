import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shap_shap/backend/firebase/firebase_storage/firebase_storage_controller.dart';
import 'package:shap_shap/factory/colors_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';
import 'package:shap_shap/screens/7.main_products_sc/9.view_all_categories_sc/all_categories_model.dart';

class ViewAllCategoriesSc extends StatelessWidget {
  const ViewAllCategoriesSc({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseStorageController controller =
        Get.find<FirebaseStorageController>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        title: Text("Categories"),
        titleTextStyle: TextStyle(
          fontSize: 40.sp,
          fontWeight: FontWeight.bold,
          color: ColorsFactory.primary,
          fontStyle: FontStyle.italic,
        ),
        centerTitle: true,
        backgroundColor: ColorsFactory.background,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0.r),
        child: GridView.builder(
          itemCount: controller.allCategoiesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, indix) {
            final categories = controller.allCategoiesList[indix];
            return AllCategoriesModel(
              name: categories['name'] ?? "An Eroor to Find The Product",
              image: categories['image'] ?? ImagesFactory.notFound,
            );
          },
        ),
      ),
    );
  }
}
