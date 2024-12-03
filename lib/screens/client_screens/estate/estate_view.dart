import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import '../../../core/widgets/app_router.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../../../generated/locale_keys.g.dart';
import '../drawer/custom_drawer.dart';
import '../estate_details/estate_details.dart';
import 'widgets/floating_estate_location.dart';

class EstateView extends StatelessWidget {
  const EstateView({super.key});

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
          title: LocaleKeys.real_estate.tr(),
        ),
      ),
      floatingActionButton: const FloatingEstateLocation(),
      body: ListView.separated(
        padding: EdgeInsets.all(24.sp),
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 16.h),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () {
            AppRouter.navigateTo(context, const EstateDetails());
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            height: 108.h,
            width: 327.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 5.r,
                  spreadRadius: 1.r,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 84.h,
                  width: 85.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/img/estate.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'اسم العقار',
                      size: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.grey,
                          size: 14.sp,
                        ),
                        AppText(
                          text: 'الرياض-حي الصحافة',
                          size: 12.sp,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/cook.svg',
                          height: 15.sp,
                        ),
                        SizedBox(width: 5.h),
                        AppText(
                          text: '1',
                          color: Colors.grey,
                          size: 14.sp,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        SvgPicture.asset(
                          'assets/svg/wash.svg',
                          height: 15.sp,
                        ),
                        SizedBox(width: 5.h),
                        AppText(
                          text: '3',
                          color: Colors.grey,
                          size: 14.sp,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        SvgPicture.asset(
                          'assets/svg/bed.svg',
                          height: 15.sp,
                        ),
                        SizedBox(width: 5.h),
                        AppText(
                          text: '4',
                          color: Colors.grey,
                          size: 14.sp,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: AppText(
                    text: '47',
                    size: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.text,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: AppText(
                    text: ' ر.س',
                    size: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
