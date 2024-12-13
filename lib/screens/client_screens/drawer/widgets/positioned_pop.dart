import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';

class PositionedPop extends StatelessWidget {
  const PositionedPop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      end: 0.w,
      top: 148.h,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          height: 50.h,
          width: 50.w,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.secondray),
          child: const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
