import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text.dart';

class OrderDetailsButton extends StatelessWidget {
  const OrderDetailsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          onPressed: () {},
          width: 165.w,
          child: const AppText(
            text: 'تأكيد الطلب',
            color: AppColors.secondray,
          ),
        ),
        AppButton(
          onPressed: () {},
          width: 165.w,
          color: const Color(0xffC02A2A),
          child: const AppText(
            text: 'الغاء الطب',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}