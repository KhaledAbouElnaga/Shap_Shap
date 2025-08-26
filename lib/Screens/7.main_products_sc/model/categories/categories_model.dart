import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shap_shap/factory/colors_factory.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CategoriesModel extends StatelessWidget {
  final String name;
  final String image;

  const CategoriesModel({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    // CacheManager renewing per week
    final cacheManager = CacheManager(
      Config(
        'weeklyCache',
        stalePeriod: const Duration(days: 7),
        maxNrOfCacheObjects: 100,
      ),
    );

    return Column(
      children: [
        Card(
          color: ColorsFactory.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: SizedBox(
              height: 50.h,
              width: 50.w,
              child: CachedNetworkImage(
                imageUrl: image,
                cacheManager: cacheManager,
                placeholder: (context, url) =>
                    CircularProgressIndicator(color: ColorsFactory.primary),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          name,
          style: TextStyle(
            color: ColorsFactory.primary,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
