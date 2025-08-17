import 'package:flutter/material.dart';
import 'package:flutter_circular_progress_indicator/flutter_circular_progress_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularProgressIndicatorClass {
  final CircularProgressIndicator circularProgressIndicator;
  CircularProgressIndicatorClass({required this.circularProgressIndicator});

  Widget cPI() {
    return CircularProgressInd().normalCircular(
      height: 55.h,
      width: 55.w,
      value: .4,
      isSpining: true,
      hasSpinReverse: true,
      valueColor: Colors.white,
      secondaryColor: Color(0xFF608BC1),
      secondaryWidth: 10.r,
      valueWidth: 6.r,
    );
  }
}
