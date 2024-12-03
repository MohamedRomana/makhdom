import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../drawer/custom_drawer.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

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
          title: LocaleKeys.notifications.tr(),
          isHomeLayout: true,
        ),
      ),
      body:
         
          ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          width: 343.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.field),
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/img/agreed.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 7.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'تم الموافقة على طلبك',
                      size: 14.sp,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 190.w,
                      child: AppText(
                        text:
                            'تمت الموافقة على طلبك المرسل بشأن الخدمة المطلوبة',
                        lines: 2,
                        color: Colors.grey,
                        size: 14.sp,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14.sp,
                      color: Colors.grey,
                    ),
                    AppText(
                      text: 'منذ 2 ساعة',
                      size: 12.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


