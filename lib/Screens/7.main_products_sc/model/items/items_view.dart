import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shap_shap/backend/firebase/firebase_storage/firebase_storage_controller.dart';
import 'package:get/get.dart';
import 'package:shap_shap/factory/color_factory.dart';
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
          child: CircularProgressIndicator(color: ColorFactory.textPrimary),
        );
      }
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // mainAxisSpacing: 10,
          // crossAxisSpacing: 10,
          childAspectRatio: 0.9,
        ),
        itemCount: controller.allItemsList.length,
        itemBuilder: (context, index) {
          final cagegory = controller.allItemsList[index];
          return Padding(
            padding: EdgeInsets.all(5.0.r),
            child: ItemsModel(
              name: cagegory['name'] ?? "An Eroor to Find The Product",
              image: cagegory['image'] ?? ImagesFactory.notFound,
              subtitle: 'later',
              price: cagegory['price'],
              favIcon: isPresed ? Icons.favorite : Icons.favorite_border,
              color: isPresed
                  ? ColorFactory.snackBarError
                  : ColorFactory.textPrimary,
              favIconFn: () {
                setState(() {});
              },
              buyIcon: Icons.shopping_cart,

              buyIconFn: () {},
            ),
          );
        },
      );
    });
  }
}
