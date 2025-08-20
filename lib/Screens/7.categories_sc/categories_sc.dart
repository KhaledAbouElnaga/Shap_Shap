import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shap_shap/CoreModels/Custom_Search_Bar/custom_search_bar.dart';
import 'package:shap_shap/factory/color_factory.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shap_shap/factory/images_factory.dart';

class CategoriesSc extends StatelessWidget {
  const CategoriesSc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shup Shup',
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorFactory.textPrimary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      children: [
                        Expanded(child: CustomSearchBar()),
                        SizedBox(width: 10.w),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorFactory.textPrimary,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              size: 35.sp,
                              color: ColorFactory.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h),
                  SvgPicture.asset(ImagesFactory.farmer, fit: BoxFit.cover),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
