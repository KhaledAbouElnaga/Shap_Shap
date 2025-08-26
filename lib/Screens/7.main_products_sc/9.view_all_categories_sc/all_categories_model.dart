import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shap_shap/factory/colors_factory.dart';

class AllCategoriesModel extends StatefulWidget {
  final String name;
  final String image;
  const AllCategoriesModel({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  State<AllCategoriesModel> createState() => _AllCategoriesModelState();
}

class _AllCategoriesModelState extends State<AllCategoriesModel> {
  @override
  Widget build(BuildContext context) {
    final cacheManager = CacheManager(
      Config(
        'weeklyCache',
        stalePeriod: const Duration(days: 7),
        maxNrOfCacheObjects: 100,
      ),
    );
    return Card(
      color: ColorsFactory.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.r),
              child: SizedBox(
                height: 100.h,
                width: 100.w,
                child: CachedNetworkImage(
                  imageUrl: widget.image,
                  cacheManager: cacheManager,
                  placeholder: (context, url) =>
                      CircularProgressIndicator(color: ColorsFactory.primary),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              widget.name,
              style: TextStyle(
                color: ColorsFactory.primary,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
