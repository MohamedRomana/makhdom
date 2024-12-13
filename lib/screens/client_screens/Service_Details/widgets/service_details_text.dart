import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../generated/locale_keys.g.dart';

class ServiceDetailsText extends StatelessWidget {
  const ServiceDetailsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: LocaleKeys.service_details.tr(),
            color: AppColors.text,
            size: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          AppText(
            lines: 3,
            text: AppCubit.get(context).servicesList['desc'] ?? "",
            color: Colors.grey,
            size: 14.sp,
          ),
          SizedBox(height: 16.h),
          const Divider(thickness: 1, color: Colors.grey)
        ],
      ),
    );
  }
}
