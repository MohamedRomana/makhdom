import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/constants/contsants.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';

class CutomPayBottomSheet extends StatelessWidget {
  const CutomPayBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      height: 384.h,
      width: 349.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 30.h),
          Container(
            height: 90.h,
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: const Color(0xff0FCC5D),
            ),
            child: Center(
              child: Icon(
                Icons.check_circle_outline_sharp,
                color: Colors.white,
                size: 40.sp,
              ),
            ),
          ),
          AppText(
            text: LocaleKeys.request_sent_successfully.tr(),
            color: const Color(0xff33353C),
            size: 20.sp,
          ),
          Container(
            height: 50.h,
            width: 253.w,
            decoration: BoxDecoration(
              color: AppColors.secondray,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: LocaleKeys.chat.tr(),
                    size: 17.sp,
                    color: AppColors.primary,
                  ),
                  Icon(
                    Icons.chat_bubble_outline,
                    color: AppColors.primary,
                    size: 20.sp,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              AppRouter.pop(context);
              makePhoneCall('+201555625858');
            },
            child: Container(
              height: 50.h,
              width: 253.w,
              decoration: BoxDecoration(
                color: AppColors.secondray,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: LocaleKeys.call.tr(),
                      size: 17.sp,
                      color: AppColors.primary,
                    ),
                    Icon(
                      Icons.phone_outlined,
                      color: AppColors.primary,
                      size: 20.sp,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}
