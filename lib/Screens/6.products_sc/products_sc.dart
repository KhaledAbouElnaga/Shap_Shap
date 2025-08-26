import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shap_shap/backend/firebase/firebase_storage/firebase_storage_controller.dart';
import 'package:shap_shap/factory/colors_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';
import 'package:shap_shap/screens/7.home_sc/model/all_items/items_model.dart';

class ProductsSc extends StatelessWidget {
  final String? categoryName;
  const ProductsSc({super.key, this.categoryName});

  @override
  Widget build(BuildContext context) {
    final FirebaseStorageController controller =
        Get.find<FirebaseStorageController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          categoryName!,
          style: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
            color: ColorsFactory.primary,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.0.r, right: 10.0.r, top: 20.0.r),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: ColorsFactory.primary),
            );
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.8,
            ),
            itemCount: controller.itemsByCategorList.length,
            itemBuilder: (context, index) {
              final item = controller.itemsByCategorList[index];
              return ItemsModel(
                name: item['name'] ?? "An Eroor to Find The Product",
                image: item['image'] ?? ImagesFactory.notFound,
                subtitle: '1KG',
                price: item['price'],
                buyIcon: Icons.shopping_cart,

                buyIconFn: () {},
              );
            },
          );
        }),
      ),
    );
  }
}
