import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/location/location.dart';
import '../../../../core/widgets/app_text.dart';

class FloatingEstateLocation extends StatelessWidget {
  const FloatingEstateLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          useSafeArea: true,
          isScrollControlled: true,
          enableDrag: false,
          useRootNavigator: true,
          elevation: 0,
          builder: (context) => SizedBox(
            height: 600.h,
            child: const Locationn(),
          ),
        );
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: 56.h,
        width: 84.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.secondray,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/Map.svg'),
            SizedBox(width: 7.w),
            AppText(
              text: LocaleKeys.show.tr(),
              color: AppColors.primary,
              size: 12.sp,
              family: 'DINArabic-Medium',
            ),
          ],
        ),
      ),
    );
  }
}
