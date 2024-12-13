// ignore_for_file: deprecated_member_use
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/core/widgets/custom_shimmer.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../../gen/fonts.gen.dart';

class RealEstateShimmer extends StatelessWidget {
  const RealEstateShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        padding: EdgeInsets.only(
          right: 16.w,
          left: 16.w,
          top: 24.h,
          bottom: 80.h,
        ),
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          return Container(
            width: 343.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
              border: Border.all(color: Colors.grey.withOpacity(.2)),
            ),
            child: Row(
              children: [
                Container(
                  height: 85.w,
                  width: 85.w,
                  margin: EdgeInsetsDirectional.only(end: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 210.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AppText(
                              text: "اسم العقار",
                              size: 14.sp,
                              family: FontFamily.dINArabicBold,
                              lines: 2,
                              color: Colors.grey.withOpacity(.2),
                            ),
                          ),
                          Row(
                            children: [
                              AppText(
                                text: "147",
                                color: Colors.grey.withOpacity(.2),
                                family: FontFamily.dINArabicBold,
                              ),
                              AppText(
                                text: " ${LocaleKeys.sar.tr()}",
                                size: 14.sp,
                                color: Colors.grey.withOpacity(.2),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.grey.withOpacity(.2),
                          size: 14.sp,
                        ),
                        SizedBox(
                          width: 130.w,
                          child: AppText(
                            start: 2.w,
                            text: "الرياض-حي الصحافة",
                            size: 10.sp,
                            lines: 2,
                            color: Colors.grey.withOpacity(.2),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                             'assets/svg/cook.svg',
                              width: 12.w,
                              fit: BoxFit.cover,
                              color: Colors.grey.withOpacity(.2),
                            ),
                            AppText(
                              start: 5.w,
                              text: "1",
                              size: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.withOpacity(.2),
                            ),
                          ],
                        ),
                        SizedBox(width: 18.w),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/wash.svg',
                              width: 12.w,
                              fit: BoxFit.cover,
                              color: Colors.grey.withOpacity(.2),
                            ),
                            AppText(
                              start: 5.w,
                              text: "3",
                              size: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.withOpacity(.2),
                            ),
                          ],
                        ),
                        SizedBox(width: 18.w),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/bed.svg',
                              width: 12.w,
                              fit: BoxFit.cover,
                              color: Colors.grey.withOpacity(.2),
                            ),
                            AppText(
                              start: 5.w,
                              text: "4",
                              size: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.withOpacity(.2),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
