import 'package:flutter/material.dart';
import 'package:shap_shap/factory/color_factory.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: ColorFactory.textTertiary),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: ColorFactory.textQuaternary),
          SizedBox(width: 5.w),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: ColorFactory.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Find fruits & vegetables...",
                hintStyle: TextStyle(
                  color: ColorFactory.textQuaternary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onChanged: (onChanged) {
                // Handle search input changes
              },
            ),
          ),
        ],
      ),
    );
  }
}
