import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shap_shap/factory/color_factory.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputFieldWidget extends StatefulWidget {
  final Color backgroundColor;
  final String hintText;
  final String? image;
  final TextEditingController controller;
  final bool isPass;
  const InputFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPass = false,
    required this.backgroundColor,
    this.image,
  });

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  bool _obsecure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.r,
            width: 20.r,
            child: widget.image != null
                ? SvgPicture.asset(widget.image!)
                : const SizedBox.shrink(),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: ColorFactory.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Color(0xff595754)),
              ),
              controller: widget.controller,
              //just for debugging
              onChanged: (value) => debugPrint('Input value: $value'),
              obscureText: widget.isPass ? _obsecure : !_obsecure,
            ),
          ),
          if (widget.isPass)
            IconButton(
              onPressed: () {
                setState(() {
                  _obsecure = !_obsecure;
                });
              },
              icon: Icon(
                _obsecure ? Icons.visibility_off : Icons.visibility,
                color: ColorFactory.black,
              ),
            ),
        ],
      ),
    );
  }
}
