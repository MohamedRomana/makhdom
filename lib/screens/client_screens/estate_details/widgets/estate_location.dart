import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/location/location.dart';
import '../../../../core/widgets/app_text.dart';

class EstateLocation extends StatelessWidget {
  const EstateLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: AppText(
            text: 'مكان العقار',
            size: 18.sp,
            color: AppColors.text,
            family: 'DINArabic-Medium',
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 178.h,
          width: 327.w,
          decoration: BoxDecoration(
            color: AppColors.secondray,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: const Locationn(),
        ),
        SizedBox(height: 47.h),
      ],
    );
  }
}
