import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shap_shap/backend/firebase/firebase_storage/firebase_storage_controller.dart';
import 'package:get/get.dart';
import 'package:shap_shap/factory/colors_factory.dart';
import 'package:shap_shap/factory/images_factory.dart';
import 'package:shap_shap/screens/7.main_products_sc/model/items/items_model.dart';

class ItemsView extends StatefulWidget {
  const ItemsView({super.key});

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  bool isPresed = false;
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
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.8,
        ),
        itemCount: controller.allItemsList.length,
        itemBuilder: (context, index) {
          final cagegory = controller.allItemsList[index];
          return ItemsModel(
            name: cagegory['name'] ?? "An Eroor to Find The Product",
            image: cagegory['image'] ?? ImagesFactory.notFound,
            subtitle: '1KG',
            price: cagegory['price'],
            buyIcon: Icons.shopping_cart,

            buyIconFn: () {},
          );
        },
      );
    });
  }
}
