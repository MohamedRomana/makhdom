import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../generated/locale_keys.g.dart';
import '../../screens/start/type/type.dart';
import '../constants/colors.dart';
import 'app_button.dart';
import 'app_router.dart';
import 'app_text.dart';

class LogiFirst extends StatelessWidget {
  const LogiFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: "قم بتسجيل الدخول اولا",
            size: 24.sp,
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
            bottom: 20.h,
          ),
          AppButton(
            onPressed: () {
              AppRouter.navigateAndPop(context, const TypeScreen());
            },
            width: 300.w,
            child: AppText(
              text: LocaleKeys.login.tr(),
              color: AppColors.secondray,
            ),
          )
        ],
      ),
    );
  }
}
