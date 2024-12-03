import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';

class ProviderNameAndRating extends StatelessWidget {
  const ProviderNameAndRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 144.h,
          width: 144.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            image: const DecorationImage(
              image: AssetImage('assets/img/provider.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 18.h),
        const AppText(
          text: 'اسم مقدم الخدمة',
          color: AppColors.text,
        ),
        RatingBar.readOnly(
          alignment: Alignment.center,
          filledIcon: Icons.star,
          emptyIcon: Icons.star_border,
          initialRating: 4,
          maxRating: 5,
          size: 18.sp,
        ),
      ],
    );
  }
}
