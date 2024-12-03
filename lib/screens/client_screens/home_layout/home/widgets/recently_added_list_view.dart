import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/app_router.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../Service_Details/service_details.dart';

class RecentlyAddedListView extends StatelessWidget {
  const RecentlyAddedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          top: 8.h,
          bottom: 8.h,
          text: LocaleKeys.recently_added.tr(),
          color: AppColors.primary,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 300.h,
          width: 343.w,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: 3,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  AppRouter.navigateTo(context, const ServiceDetails());
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/work.png'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              text:  'اسم الخدمه',
                              size: 14.sp,
                              color: AppColors.text,
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                SvgPicture.asset('assets/svg/bag.svg'),
                                SizedBox(width: 4.w),
                                AppText(
                                  text: 'اسم القسم',
                                  size: 12.sp,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 100.w),
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
