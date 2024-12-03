import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import 'package:makhdom/screens/client_screens/estate/estate_view.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/app_text.dart';

class EstateContainer extends StatelessWidget {
  const EstateContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.navigateTo(context, const EstateView());
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        height: 80.h,
        width: 343.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.prelight),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: LocaleKeys.real_estate.tr(),
                size: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: const Color.fromARGB(58, 255, 255, 255),
                ),
                child: Image.asset('assets/img/house.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
