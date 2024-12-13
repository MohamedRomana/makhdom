import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_cached.dart';

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
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: AppCachedImage(
            image: AppCubit.get(context).provider['avatar'] ?? "",
            height: 144.h,
            width: 144.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 18.h),
        AppText(
          text: AppCubit.get(context).provider['first_name'] ?? "",
          color: AppColors.text,
        ),
        RatingBar.readOnly(
          alignment: Alignment.center,
          filledIcon: Icons.star,
          emptyIcon: Icons.star_border,
          initialRating: AppCubit.get(context).provider['rate'].toDouble(),
          maxRating: 5,
          size: 18.sp,
        ),
      ],
    );
  }
}
