import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';

class EstateLocationAndPrice extends StatelessWidget {
  const EstateLocationAndPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150.h,
          width: 327.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            image: const DecorationImage(
              image: AssetImage('assets/img/bigestate.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 25.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'اسم العقار',
                  size: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 7.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Colors.grey,
                      size: 14.sp,
                    ),
                    AppText(
                      text: 'الرياض-حي الصحافة',
                      size: 12.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            AppText(
              text: '140,000',
              size: 16.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
            ),
            AppText(
              text: 'ر.س',
              size: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.text,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            SvgPicture.asset(
              'assets/svg/cook.svg',
              height: 20.sp,
            ),
            SizedBox(width: 5.h),
            AppText(
              text: '1',
              color: Colors.grey,
              size: 20.sp,
            ),
            SizedBox(
              width: 20.w,
            ),
            SvgPicture.asset(
              'assets/svg/wash.svg',
              height: 20.sp,
            ),
            SizedBox(width: 5.h),
            AppText(
              text: '3',
              color: Colors.grey,
              size: 20.sp,
            ),
            SizedBox(
              width: 20.w,
            ),
            SvgPicture.asset(
              'assets/svg/bed.svg',
              height: 20.sp,
            ),
            SizedBox(width: 5.h),
            AppText(
              text: '4',
              color: Colors.grey,
              size: 20.sp,
            ),
          ],
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
