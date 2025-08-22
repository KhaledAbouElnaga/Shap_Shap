import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shap_shap/factory/color_factory.dart';

class ItemsModel extends StatelessWidget {
  final String name;
  final String image;
  final String subtitle;
  final double price;
  final IconData favIcon;
  final VoidCallback favIconFn;
  final IconData buyIcon;
  final VoidCallback buyIconFn;

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                cacheManager: cacheManager,
                placeholder: (context, url) =>
                    CircularProgressIndicator(color: ColorFactory.textPrimary),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: favIconFn,
                  icon: Icon(
                    favIcon,
                    // isPresed ? Icons.favorite : Icons.favorite_border,
                    // color: isPresed
                    //     ? ColorFactory.alertError
                    //     : ColorFactory.secondary,
                  ),
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
    );
  }
}
