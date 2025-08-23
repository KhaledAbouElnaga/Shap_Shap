import 'package:flutter/material.dart';
import 'package:shap_shap/factory/colors_factory.dart';
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
        border: Border.all(color: ColorsFactory.searchBarColor),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: ColorsFactory.textSecondery),
          SizedBox(width: 5.w),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: ColorsFactory.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Find fruits & vegetables...",
                hintStyle: TextStyle(
                  color: ColorsFactory.textSecondery,
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
