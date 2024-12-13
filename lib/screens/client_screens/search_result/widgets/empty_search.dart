import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_lottie_widget.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../generated/locale_keys.g.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 130.h),
      child: Column(
        children: [
          CustomLottieWidget(
            lottieName: Assets.img.emptysearch,
            width: 250.w,
            height: 250.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: AppText(
              text: LocaleKeys.noSearch.tr(),
              size: 25.sp,
              top: 20.h,
              textAlign: TextAlign.center,
              color: AppColors.primary,
              fontStyle: FontStyle.italic,
              family: FontFamily.dINArabicBold,
              lines: 5,
            ),
          )
        ],
      ),
    );
  }
}
