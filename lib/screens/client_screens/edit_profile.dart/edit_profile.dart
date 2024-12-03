import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/widgets/custom_app_bar.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import 'package:makhdom/screens/client_screens/drawer/custom_drawer.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_input.dart';
import '../../../core/widgets/app_router.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_bottom_nav.dart';

final _formKey = GlobalKey<FormState>();
final _nameController = TextEditingController();
final _phoneController = TextEditingController();
final _cityController = TextEditingController();

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(langContext: context),
      bottomNavigationBar: const CustomBottomNav(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          title: LocaleKeys.edit_profile.tr(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 120.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Image.asset('assets/img/human.png'),
              ),
            ),
            SizedBox(height: 30.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: LocaleKeys.name.tr(),
                  size: 14.sp,
                  color: AppColors.text,
                  start: 24.w,
                  bottom: 10.w,
                ),
                AppInput(
                  filled: true,
                  controller: _nameController,
                  color: AppColors.field,
                  enabledBorderColor: Colors.grey,
                  focusedBorderColor: Colors.grey,
                  hint: LocaleKeys.enter_user_name.tr(),
                ),
                AppText(
                  text: LocaleKeys.phone.tr(),
                  size: 14.sp,
                  color: AppColors.text,
                  start: 24.w,
                  top: 16.h,
                  bottom: 10.h,
                ),
                AppInput(
                  filled: true,
                  controller: _phoneController,
                  color: AppColors.field,
                  enabledBorderColor: Colors.grey,
                  focusedBorderColor: Colors.grey,
                  hint: LocaleKeys.phone_number.tr(),
                ),
                AppText(
                  text: LocaleKeys.city.tr(),
                  size: 14.sp,
                  color: AppColors.text,
                  start: 24.w,
                  top: 16.h,
                  bottom: 10.h,
                ),
                AppInput(
                  filled: true,
                  color: AppColors.field,
                  enabledBorderColor: Colors.grey,
                  controller: _cityController,
                  focusedBorderColor: Colors.grey,
                  hint: LocaleKeys.selectCity.tr(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: AppButton(
                onPressed: () {
                  AppRouter.pop(context);
                },
                width: 343.w,
                color: AppColors.primary,
                child: AppText(
                  text: LocaleKeys.save.tr(),
                  color: AppColors.secondray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
