import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';

class CustomAuthHeader extends StatelessWidget {
  final String text;
  final double? bottom;
  final double? top;
  final double? left;
  final double? right;

  final CrossAxisAlignment? crossAxisAlignment;
  const CustomAuthHeader({
    super.key,
    required this.text,
    this.bottom,
    this.top,
    this.crossAxisAlignment,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left ?? 0, right: right ?? 0),
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.img.logo.path,
            height: 100.h,
            width: 100.w,
            fit: BoxFit.cover,
          ),
          AppText(
            top: top ?? 47.h,
            bottom: bottom ?? 14.h,
            text: text,
            size: 24.sp,
            color: AppColors.boldText,
            family: FontFamily.dINArabicBold,
          ),
        ],
      ),
    );
  }
}
