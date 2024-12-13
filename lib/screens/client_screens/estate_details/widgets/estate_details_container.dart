import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';

class EstateDetailsContainer extends StatelessWidget {
  const EstateDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: AppText(
            text: 'تفاصيل العقار',
            size: 18.sp,
            color: AppColors.text,
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          height: 283.h,
          width: 327.w,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.secondray.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppText(
                    text: 'سعر المتر:',
                    size: 14.sp,
                    family: 'DINArabic-Medium',
                  ),
                  const Spacer(),
                  AppText(
                    text: AppCubit.get(context)
                        .showEstateList['meter_price']
                        .toString(),
                    size: 14.sp,
                    family: 'DINArabic-Light',
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                children: [
                  AppText(
                    text: 'النوع:',
                    size: 14.sp,
                    family: 'DINArabic-Medium',
                  ),
                  const Spacer(),
                  AppText(
                    text:
                        AppCubit.get(context).showEstateList['section_title'] ??
                            "",
                    size: 14.sp,
                    family: 'DINArabic-Light',
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                children: [
                  AppText(
                    text: 'الطابق:',
                    size: 14.sp,
                    family: 'DINArabic-Medium',
                  ),
                  const Spacer(),
                  AppText(
                    text: AppCubit.get(context)
                        .showEstateList['floors_count']
                        .toString(),
                    size: 14.sp,
                    family: 'DINArabic-Light',
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                children: [
                  AppText(
                    text: 'سنة البناء:',
                    size: 14.sp,
                    family: 'DINArabic-Medium',
                  ),
                  const Spacer(),
                  AppText(
                    text:
                        AppCubit.get(context).showEstateList['year'].toString(),
                    size: 14.sp,
                    family: 'DINArabic-Light',
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                children: [
                  AppText(
                    text: 'نوع التشطيب:',
                    size: 14.sp,
                    family: 'DINArabic-Medium',
                  ),
                  const Spacer(),
                  AppText(
                    text:
                        AppCubit.get(context).showEstateList['finish_title'] ??
                            "",
                    size: 14.sp,
                    family: 'DINArabic-Light',
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                children: [
                  AppText(
                    text: 'تطل على:',
                    size: 14.sp,
                    family: 'DINArabic-Medium',
                  ),
                  const Spacer(),
                  AppText(
                    text: AppCubit.get(context).showEstateList['view_title'] ?? "",
                    size: 14.sp,
                    family: 'DINArabic-Light',
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
