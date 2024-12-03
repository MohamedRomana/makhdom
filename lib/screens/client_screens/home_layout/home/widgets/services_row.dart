import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/screens/client_screens/Direct_services/direct_services.dart';
import 'package:makhdom/screens/client_screens/scheduled_services/scheduled_services.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../generated/locale_keys.g.dart';

class ServicesRow extends StatelessWidget {
  const ServicesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              AppRouter.navigateTo(context, const ScheduledServices());
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              width: 166.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.light),
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 48.h,
                      width: 48.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Image.asset('assets/img/key.png'),
                    ),
                    AppText(
                      text: LocaleKeys.scheduled_services.tr(),
                      size: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      lines: 2,
                      start: 50.w,
                      top: 13.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              AppRouter.navigateTo(context, const DirectServices());
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              width: 166.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.primary),
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 48.h,
                      width: 48.w,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(35, 255, 255, 255),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Image.asset('assets/img/bag.png'),
                    ),
                    AppText(
                      start: 50.w,
                      top: 13.h,
                      text: LocaleKeys.direct_services.tr(),
                      size: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      lines: 2,
                    )
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
