import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../generated/locale_keys.g.dart';

class ServiceContainer extends StatelessWidget {
  const ServiceContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132.h,
      width: 327.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 16.w),
        child: Row(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
              child: Image.asset(
                'assets/img/work.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: 'اسم الخدمة',
                    size: 14.sp,
                    color: AppColors.text,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/bag.svg',
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 6.w),
                      AppText(
                        text: 'اسم القسم',
                        size: 12.sp,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/gps.svg',
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 6.w),
                      AppText(
                        text: 'الرياض',
                        size: 12.sp,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AppText(
                        text: '${LocaleKeys.price.tr()}: ',
                        size: 12.sp,
                        color: AppColors.text,
                      ),
                      AppText(
                        text: '47',
                        size: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff5669FF),
                      ),
                      AppText(
                        text: ' ${LocaleKeys.currency.tr()}',
                        size: 12.sp,
                        color: AppColors.text,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
