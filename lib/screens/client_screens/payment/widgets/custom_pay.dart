import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';

class CustomPay extends StatelessWidget {
  const CustomPay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: LocaleKeys.choose_payment_method.tr(),
          size: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 8.w),
        const Divider(thickness: 1, color: Colors.grey),
        SizedBox(height: 18.w),
        Row(
          children: [
            Image.asset('assets/img/apple-pay.png'),
            SizedBox(width: 8.w),
            AppText(
              text: 'Apple Pay',
              size: 15.sp,
              fontWeight: FontWeight.w700,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.secondray,
              size: 16.sp,
            )
          ],
        ),
        SizedBox(height: 21.h),
        Row(
          children: [
            Image.asset('assets/img/cash.png'),
            SizedBox(width: 8.w),
            AppText(
              text: LocaleKeys.cash_payment.tr(),
              size: 15.sp,
              fontWeight: FontWeight.w700,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.secondray,
              size: 16.sp,
            )
          ],
        ),
        SizedBox(height: 21.h),
        Row(
          children: [
            Image.asset('assets/img/visa.png'),
            SizedBox(width: 8.w),
            AppText(
              text: '4153 xxxx xxxxx 0981',
              size: 15.sp,
              fontWeight: FontWeight.w700,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.secondray,
              size: 16.sp,
            )
          ],
        ),
        SizedBox(height: 32.h),
        Row(
          children: [
            Icon(
              Icons.add,
              color: AppColors.text,
              size: 20.sp,
            ),
            AppText(
              text: LocaleKeys.add_payment_method.tr(),
              size: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ],
    );
  }
}
