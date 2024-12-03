import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/screens/client_screens/order_details/order_details.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/app_text.dart';

class CurrentRequests extends StatelessWidget {
  const CurrentRequests({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 16.h),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () {
          AppRouter.navigateTo(context, const OrderDetails());
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          width: 343.w,
          decoration: BoxDecoration(
            color: AppColors.secondray.withOpacity(0.33),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'رقم الطلب: 23456',
                      size: 16.sp,
                      family: 'DINArabic-Medium',
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          size: 14.sp,
                        ),
                        AppText(
                          text: 'من ساعة',
                          size: 14.sp,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ],
                ),
                AppText(
                  text: 'اسم الخدمة: تنظيف وتعقيم',
                  size: 16.sp,
                  family: 'DINArabic-Light',
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    height: 24.h,
                    width: 83.w,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: const Color(0xffFF8800),
                      ),
                    ),
                    child: Center(
                      child: AppText(
                        text: 'جاري التنفيذ',
                        size: 13.sp,
                        color: const Color(0xffFF8800),
                      ),
                    ),
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
