import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/location/location.dart';
import '../../../../core/widgets/app_text.dart';

class FloatingLocation extends StatelessWidget {
  const FloatingLocation({
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
          color: AppColors.secondray,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset('assets/svg/Map.svg'),
            const AppText(
              text: 'عرض',
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
