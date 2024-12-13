// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makhdom/core/widgets/custom_shimmer.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../../../../generated/locale_keys.g.dart';

class CustomHomeShimmer extends StatelessWidget {
  const CustomHomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 150.h,
                  width: 343.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 109.h,
                      width: 166.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.2),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    Container(
                      height: 109.h,
                      width: 166.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.2),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17.h),
                Container(
                  height: 80.h,
                  width: 343.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                SizedBox(height: 25.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: AppText(
                    text: LocaleKeys.recently_added.tr(),
                    color: Colors.grey.withOpacity(.2),
                    family: FontFamily.dINArabicBold,
                    size: 18.sp,
                    bottom: 10.h,
                  ),
                ),
                SizedBox(
                  height: 200.h,
                  child: ListView.separated(
                    itemBuilder: (context, index) => Container(
                      height: 80.h,
                      width: 343.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(.2),
                        ),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 48.w,
                          width: 48.w,
                          margin: EdgeInsetsDirectional.only(end: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.grey.withOpacity(.2),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 250.w,
                              child: AppText(
                                text: "اسم الخدمة",
                                size: 14.sp,
                                bottom: 8.h,
                                lines: 2,
                                color: Colors.grey.withOpacity(.2),
                              ),
                            ),
                            SizedBox(
                              width: 250.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/home.svg',
                                        width: 12.w,
                                        fit: BoxFit.cover,
                                        color: Colors.grey.withOpacity(.2),
                                      ),
                                      SizedBox(
                                        width: 130.w,
                                        child: AppText(
                                          start: 3.w,
                                          text: "اسم القسم",
                                          size: 12.sp,
                                          lines: 2,
                                          color: Colors.grey.withOpacity(.2),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AppText(
                                        text: "${LocaleKeys.price.tr()}: ",
                                        size: 12.sp,
                                        color: Colors.grey.withOpacity(.2),
                                      ),
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
                          ],
                        ),
                      ],
                    ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 16.h,
                    ),
                    itemCount: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
