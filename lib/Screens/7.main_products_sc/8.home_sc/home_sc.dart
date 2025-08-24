import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shap_shap/factory/colors_factory.dart';
import 'package:shap_shap/screens/7.main_products_sc/9.view_all_categories_sc/view_all_categories_sc.dart';
import 'package:shap_shap/screens/7.main_products_sc/model/categories/categories_view.dart';
import 'package:shap_shap/screens/7.main_products_sc/model/items/items_view.dart';

class HomeSc extends StatelessWidget {
  const HomeSc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0.r, right: 10.0.r, top: 10.0.r),
          child: Column(
            children: [
              Text(
                'Shup Shup',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsFactory.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 15.h),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 5.0.r),
              //   child: Row(
              //     children: [
              //       Expanded(child: CustomSearchBar()),
              //       SizedBox(width: 10.w),
              //       Container(
              //         decoration: BoxDecoration(
              //           color: ColorsFactory.primary,
              //           borderRadius: BorderRadius.circular(50.r),
              //         ),
              //         //Favorite Icon Button
              //         child: IconButton(
              //           onPressed: () {},
              //           icon: Icon(
              //             Icons.favorite_border,
              //             size: 35.sp,
              //             color: ColorsFactory.white,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 7.5.h),
              Padding(
                padding: EdgeInsets.all(15.0.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          color: ColorsFactory.textPrimery,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        // To see all categories
                        onTap: () => {Get.to(ViewAllCategoriesSc())},
                        child: Text(
                          "View all",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ColorsFactory.textPrimery,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 5.h),
              SizedBox(height: 130.h, child: CategoriesView()),
              // SizedBox(height: 5.h),
              Expanded(child: ItemsView()),
            ],
          ),
        ),
      ),
    );
  }
}
