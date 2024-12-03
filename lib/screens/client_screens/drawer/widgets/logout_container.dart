import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../generated/locale_keys.g.dart';

class LogOutContainer extends StatelessWidget {
  const LogOutContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      bottom: 50,
      child: Row(
        children: [
          Container(
            width: 243.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: const Color(0xffFFE2E2),
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(100.r),
                bottomEnd: Radius.circular(100.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 4.w,
                  height: 48.h,
                  decoration: const BoxDecoration(
                    color: Color(0xffFE5050),
                  ),
                ),
                AppText(
                  start: 8.w,
                  text: LocaleKeys.exittheapplication.tr(),
                  size: 17.sp,
                  color: const Color(0xffFE5050),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 8.w),
                  child: SvgPicture.asset('assets/svg/logout.svg'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}