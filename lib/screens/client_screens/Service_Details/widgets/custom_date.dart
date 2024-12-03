import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/service/cubit/app_cubit.dart';
import '../../../../core/widgets/app_text.dart';

class CustomDate extends StatelessWidget {
  const CustomDate({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: LocaleKeys.available_appointments.tr(),
          size: 18.sp,
          color: AppColors.text,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 8.w),
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            separatorBuilder: (context, index) =>
                SizedBox(width: 8.w),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                color:
                    AppCubit.get(context).chooseDateIndex == index
                        ? AppColors.primary
                        : Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  AppText(
                    text: 'Sun',
                    size: 13.sp,
                    color:
                        AppCubit.get(context).chooseDateIndex ==
                                index
                            ? Colors.white
                            : AppColors.text,
                  ),
                  AppText(
                    text: '5',
                    size: 19.sp,
                    fontWeight: FontWeight.w700,
                    color:
                        AppCubit.get(context).chooseDateIndex ==
                                index
                            ? Colors.white
                            : AppColors.text,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
