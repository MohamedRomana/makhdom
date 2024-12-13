import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_input.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_shimmer.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../../../../generated/locale_keys.g.dart';

class CustomProfileShimmer extends StatelessWidget {
  const CustomProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 30.h,
          right: 16.w,
          left: 16.w,
          bottom: 32.h,
        ),
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 120.w,
                width: 120.w,
                margin: EdgeInsets.only(bottom: 30.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(.2),
                ),
              ),
              AppInput(
                bottom: 16.h,
                filled: true,
                color: Colors.grey.withOpacity(.2),
                read: true,
                start: 0,
                end: 0,
                hint: LocaleKeys.name.tr(),
                hintColor: Colors.grey.withOpacity(.2),
                enabledBorderColor: Colors.grey.withOpacity(.2),
                focusedBorderColor: Colors.grey.withOpacity(.2),
              ),
              AppInput(
                bottom: 16.h,
                filled: true,
                color: Colors.grey.withOpacity(.2),
                read: true,
                start: 0,
                end: 0,
                hint: LocaleKeys.phone.tr(),
                hintColor: Colors.grey.withOpacity(.2),
                enabledBorderColor: Colors.grey.withOpacity(.2),
                focusedBorderColor: Colors.grey.withOpacity(.2),
              ),
              AppInput(
                bottom: 25.h,
                filled: true,
                color: Colors.grey.withOpacity(.2),
                read: true,
                start: 0,
                end: 0,
                hint: LocaleKeys.city.tr(),
                hintColor: Colors.grey.withOpacity(.2),
                enabledBorderColor: Colors.grey.withOpacity(.2),
                focusedBorderColor: Colors.grey.withOpacity(.2),
              ),
              AppButton(
                onPressed: () {},
                bottom: 25.h,
                width: 343.w,
                color: Colors.grey.withOpacity(.2),
                child: AppText(
                  text: LocaleKeys.editInformation.tr(),
                  color: Colors.grey.withOpacity(.2),
                  family: FontFamily.dINArabicBold,
                ),
              ),
              AppButton(
                onPressed: () {},
                width: 343.w,
                color: Colors.grey.withOpacity(.2),
                child: AppText(
                  text: LocaleKeys.deleteAccount.tr(),
                  color: Colors.grey.withOpacity(.2),
                  family: FontFamily.dINArabicBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
