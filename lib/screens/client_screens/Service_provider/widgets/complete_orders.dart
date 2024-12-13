import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';

class CompleteOrders extends StatelessWidget {
  const CompleteOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(top: 32.h, bottom: 13.h),
          child: Container(
            height: 50.h,
            width: 343.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.field,
              border: Border.all(color: Colors.grey),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'الطلبات المكتملة',
                    size: 15.sp,
                    color: Colors.black,
                  ),
                  AppText(
                    text: '+${AppCubit.get(context).provider['provider_orders']} طلب',
                    size: 15.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
