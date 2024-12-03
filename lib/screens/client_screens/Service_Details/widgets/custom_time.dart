import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';

class CustomTime extends StatelessWidget {
  const CustomTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: LocaleKeys.available_times.tr(),
            size: 18.sp,
            color: AppColors.text,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 8.h),
          SizedBox(
            height: 40.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8.h),
              itemCount: 4,
              itemBuilder: (context, index) => Container(
                height: 38.h,
                width: 72.w,
                decoration: BoxDecoration(
                  color: AppCubit.get(context).chooseTimeIndex == index
                      ? AppColors.primary
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: '1:30 AM',
                      size: 14.sp,
                      color: AppCubit.get(context).chooseTimeIndex == index
                          ? Colors.white
                          : AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
