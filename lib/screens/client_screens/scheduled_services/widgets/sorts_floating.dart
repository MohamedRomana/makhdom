import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';

class SortsFloating extends StatelessWidget {
  const SortsFloating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            height: 227.h,
            width: 343.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(19.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(3, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 38.h, horizontal: 22.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: AppText(
                        text: LocaleKeys.sort_by_lowest_price.tr(),
                        size: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: AppText(
                        text: LocaleKeys.sort_by_highest_rating.tr(),
                        size: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: AppText(
                        text: LocaleKeys.sort_by_closest.tr(),
                        size: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ),
        );
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: 56.h,
        width: 84.w,
        decoration: BoxDecoration(
          color: AppColors.secondray,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: LocaleKeys.sort.tr(),
              size: 14.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(width: 9.w),
            SvgPicture.asset('assets/svg/circle.svg'),
          ],
        ),
      ),
    );
  }
}
