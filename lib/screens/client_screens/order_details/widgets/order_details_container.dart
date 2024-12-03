import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';

class OrderDetailsContainer extends StatelessWidget {
  const OrderDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      height: 301.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: AppColors.secondray.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: 'رقم الطلب: 23456',
            size: 16.sp,
            family: 'DINArabic-Medium',
          ),
          AppText(
            text: 'اسم الخدمة: تنظيف وتعقيم',
            size: 16.sp,
            family: 'DINArabic-Light',
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              Icon(
                Icons.access_time,
                color: AppColors.primary,
                size: 24.sp,
              ),
              AppText(
                text: 'الوقت',
                size: 14.sp,
              ),
              const Spacer(),
              AppText(
                text: 'الخميس 28/10/2024',
                size: 14.sp,
                color: Colors.grey,
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.primary,
                size: 24.sp,
              ),
              AppText(
                text: 'الموقع',
                size: 14.sp,
              ),
              const Spacer(),
              AppText(
                text: 'الرياض',
                size: 14.sp,
                color: Colors.grey,
              )
            ],
          ),
          Row(
            children: [
              SvgPicture.asset('assets/svg/Dollar.svg'),
              AppText(
                text: 'طريقة الدفع',
                size: 14.sp,
              ),
              const Spacer(),
              AppText(
                text: 'كاش',
                size: 14.sp,
                color: Colors.grey,
              )
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              SvgPicture.asset('assets/svg/User.svg'),
              AppText(
                text: 'اسم مقدم الخدمة',
                size: 14.sp,
              ),
              const Spacer(),
              AppText(
                text: 'محمد احمد',
                size: 14.sp,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}