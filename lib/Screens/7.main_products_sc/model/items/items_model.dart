import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shap_shap/factory/colors_factory.dart';

class ItemsModel extends StatelessWidget {
  final String name;
  final String image;
  final String subtitle;
  final int price;

  final IconData buyIcon;
  final VoidCallback buyIconFn;

  const ItemsModel({
    super.key,
    required this.name,
    required this.image,
    required this.subtitle,
    required this.price,
    required this.buyIcon,
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

    return Center(
      child: Card(
        elevation: 5,
        color: ColorsFactory.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 10.r,
            right: 12.r,
            left: 12.r,
            top: 10.r,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: 100.h,
                  cacheManager: cacheManager,
                  placeholder: (context, url) =>
                      CircularProgressIndicator(color: ColorsFactory.primary),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                name,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsFactory.textSecondery,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${price.toString()} TL",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: const BoxDecoration(
                      color: ColorsFactory.orange,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        buyIcon,
                        color: ColorsFactory.white,
                        size: 20.sp,
                      ),
                      onPressed: buyIconFn,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
