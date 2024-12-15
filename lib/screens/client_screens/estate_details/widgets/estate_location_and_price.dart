import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_cached.dart';
import 'package:makhdom/generated/locale_keys.g.dart';

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
        ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: AppCachedImage(
            image: AppCubit.get(context).showEstateList['first_image'] ?? "",
            height: 150.h,
            width: 327.w,
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
                  text: AppCubit.get(context).showEstateList['title'] ?? "",
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
                      text:
                          AppCubit.get(context).showEstateList['address'] ?? "",
                      size: 12.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            AppText(
              text: AppCubit.get(context).showEstateList['price'].toString(),
              size: 16.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
            ),
            AppText(
              text: " ${LocaleKeys.sar.tr()}",
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
              text: AppCubit.get(context).showEstateList['area'].toString(),
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
              text: AppCubit.get(context)
                  .showEstateList['bathrooms_count']
                  .toString(),
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
              text: AppCubit.get(context)
                  .showEstateList['rooms_count']
                  .toString(),
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
