import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shap_shap/factory/color_factory.dart';

class ItemsModel extends StatelessWidget {
  final String name;
  final String image;
  final String subtitle;
  final int price;
  final IconData favIcon;
  final VoidCallback favIconFn;
  final IconData buyIcon;
  final VoidCallback buyIconFn;
  final Color color;

  const ItemsModel({
    super.key,
    required this.name,
    required this.image,
    required this.subtitle,
    required this.price,
    required this.favIcon,
    required this.buyIcon,
    required this.favIconFn,
    required this.buyIconFn,
    required this.color,
  });

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
    return Card(
      color: ColorFactory.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(14.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 12.0.r, left: 12.0.r, top: 5.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    width: double.infinity,
                    cacheManager: cacheManager,
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: ColorFactory.textPrimary,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      color: color,
                      onPressed: favIconFn,
                      icon: Icon(favIcon),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              name,
              style: TextStyle(
                color: ColorFactory.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              subtitle,
              style: TextStyle(
                color: ColorFactory.textQuaternary,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    price.toString(),
                    style: TextStyle(
                      color: ColorFactory.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(onPressed: buyIconFn, icon: Icon(buyIcon)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
