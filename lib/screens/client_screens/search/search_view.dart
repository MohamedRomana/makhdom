import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/widgets/app_button.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/screens/client_screens/search_result/search_result.dart';
import '../../../core/widgets/app_input.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../../../generated/locale_keys.g.dart';
import '../drawer/custom_drawer.dart';

class SearchView extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController serviceNameController;
  final TextEditingController serviceTypeController;
  final TextEditingController cityController;
  final TextEditingController serviceRateController;
  const SearchView({
    super.key,
    required this.formKey,
    required this.serviceNameController,
    required this.serviceTypeController,
    required this.cityController,
    required this.serviceRateController,
  });

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
          title: LocaleKeys.search.tr(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'اسم الخدمة',
              size: 14.sp,
              color: AppColors.text,
              bottom: 24.h,
              start: 24.w,
            ),
            AppInput(
              filled: true,
              color: AppColors.field,
              hint: 'ادخل اسم الخدمة',
              enabledBorderColor: Colors.grey,
              focusedBorderColor: Colors.grey,
              controller: serviceNameController,
            ),
            AppText(
              text: 'نوع الخدمة',
              size: 14.sp,
              color: AppColors.text,
              bottom: 24.h,
              start: 24.w,
              top: 16.h,
            ),
            AppInput(
              filled: true,
              color: AppColors.field,
              hint: 'اختر نوع الخدمة',
              enabledBorderColor: Colors.grey,
              focusedBorderColor: Colors.grey,
              controller: serviceTypeController,
            ),
            AppText(
              text: 'المدينة',
              size: 14.sp,
              color: AppColors.text,
              bottom: 24.h,
              start: 24.w,
              top: 16.h,
            ),
            AppInput(
              filled: true,
              color: AppColors.field,
              hint: 'اختر المدينة',
              enabledBorderColor: Colors.grey,
              focusedBorderColor: Colors.grey,
              controller: cityController,
            ),
            AppText(
              text: 'تقييم الخدمة',
              size: 14.sp,
              color: AppColors.text,
              bottom: 24.h,
              start: 24.w,
              top: 16.h,
            ),
            AppInput(
              filled: true,
              color: AppColors.field,
              hint: 'التقييم الأعلى',
              enabledBorderColor: Colors.grey,
              focusedBorderColor: Colors.grey,
              controller: serviceRateController,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
              child: AppButton(
                onPressed: () {
                  AppRouter.navigateTo(context, const SearchResult());
                },
                width: 343.w,
                child: const AppText(
                  text: 'بحث',
                  color: AppColors.secondray,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
