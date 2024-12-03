import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/widgets/app_input.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/screens/client_screens/edit_profile.dart/edit_profile.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../drawer/custom_drawer.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(langContext: context),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          title: LocaleKeys.profile.tr(),
          isHomeLayout: true,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
        child: Column(
          children: [
            Container(
              height: 120.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Image.asset('assets/img/human.png'),
            ),
            SizedBox(height: 30.h),
            AppInput(
              filled: true,
              isEnabled: false,
              color: AppColors.field,
              disableBorderColor: Colors.grey,
              prefixIcon: AppText(
                top: 16.h,
                bottom: 16.h,
                start: 16.w,
                end: 16.w,
                text: LocaleKeys.name.tr(),
                color: Colors.black,
              ),
              suffixIcon: AppText(
                top: 16.h,
                bottom: 16.h,
                start: 16.w,
                end: 16.w,
                text: 'على محمد على',
                color: Colors.black.withOpacity(0.6.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: AppInput(
                filled: true,
                isEnabled: false,
                color: AppColors.field,
                disableBorderColor: Colors.grey,
                prefixIcon: AppText(
                  top: 16.h,
                  bottom: 16.h,
                  start: 16.w,
                  end: 16.w,
                  text: LocaleKeys.phone.tr(),
                  color: Colors.black,
                ),
                suffixIcon: AppText(
                  top: 16.h,
                  bottom: 16.h,
                  start: 16.w,
                  end: 16.w,
                  text: '+96 3470967396',
                  color: Colors.black.withOpacity(0.6.sp),
                ),
              ),
            ),
            AppInput(
              filled: true,
              isEnabled: false,
              color: AppColors.field,
              disableBorderColor: Colors.grey,
              prefixIcon: AppText(
                top: 16.h,
                bottom: 16.h,
                start: 16.w,
                end: 16.w,
                text: LocaleKeys.city.tr(),
                color: Colors.black,
              ),
              suffixIcon: AppText(
                top: 16.h,
                bottom: 16.h,
                start: 16.w,
                end: 16.w,
                text: 'الرياض',
                color: Colors.black.withOpacity(0.6.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: AppButton(
                onPressed: () {
                  AppRouter.navigateTo(context, const EditProfile());
                },
                width: 343.w,
                color: AppColors.primary,
                child: AppText(
                  text: LocaleKeys.edit_profile.tr(),
                  color: AppColors.secondray,
                ),
              ),
            ),
            AppButton(
              onPressed: () {},
              color: const Color(0xffFF0909),
              width: 343.w,
              child: AppText(
                  text: LocaleKeys.delete_account.tr(), color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
