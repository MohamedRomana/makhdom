import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            text: 'وصف العقار',
            color: AppColors.text,
            size: 18.sp,
            family: 'DINArabic-Medium',
          ),
        ),
        SizedBox(
          width: 317.w,
          child: AppText(
            text:
                'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات',
            lines: 3,
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