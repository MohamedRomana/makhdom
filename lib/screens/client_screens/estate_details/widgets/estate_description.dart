import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/generated/locale_keys.g.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';

class EstateDescription extends StatelessWidget {
  const EstateDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: AppText(
            text: LocaleKeys.property_description.tr(),
            color: AppColors.text,
            size: 18.sp,
            family: 'DINArabic-Medium',
          ),
        ),
        SizedBox(
          width: 317.w,
          child: AppText(
            text: AppCubit.get(context).showEstateList['desc'] ?? "" , lines: 3,
            size: 14.sp,
            color: Colors.grey,
            family: 'DINArabic-Light',
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
