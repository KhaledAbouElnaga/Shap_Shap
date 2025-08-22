import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shap_shap/factory/color_factory.dart';
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
          color: ColorFactory.light,
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
                    CircularProgressIndicator(color: ColorFactory.textPrimary),
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
            color: ColorFactory.textPrimary,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shap_shap/factory/color_factory.dart';

// class CategoriesModel extends StatelessWidget {
//   final String name;
//   final String image;
//   const CategoriesModel({super.key, required this.name, required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: EdgeInsets.only(
//                   right: 20.r,
//                   left: 12.r,
//                   top: 12.r,
//                   bottom: 12.r,
//                 ),
//                 decoration: BoxDecoration(
//                   color: ColorFactory.textQuinary,
//                   borderRadius: BorderRadius.horizontal(
//                     left: Radius.circular(50.r),
//                     right: Radius.circular(50.r),
//                   ),
//                 ),
//                 // height: 100,
//                 // width: 100,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       height: 50.h,
//                       width: 50.w,
//                       child: Image.asset(image),
//                     ),
//                     SizedBox(width: 10.w),
//                     Text(
//                       name,
//                       style: TextStyle(
//                         color: ColorFactory.textPrimary,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
