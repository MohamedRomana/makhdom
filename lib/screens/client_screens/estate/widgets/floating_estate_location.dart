import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
          backgroundColor: Colors.transparent,
          useSafeArea: true,
          isScrollControlled: true,
          enableDrag: false,
          useRootNavigator: true,
          elevation: 0,
          builder: (context) => Container(
            height: 600.h,
            margin: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
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
              text: 'عرض',
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
