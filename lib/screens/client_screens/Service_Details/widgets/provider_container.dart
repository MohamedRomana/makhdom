import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/screens/client_screens/Service_provider/service_provider.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';

class ProviderContainer extends StatelessWidget {
  const ProviderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.navigateTo(context, const ServiceProvider());
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/img/person.png'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'اسم مقدم الخدمة',
                        size: 14.sp,
                        color: AppColors.text,
                      ),
                      Row(
                        children: [
                          AppText(
                            text: '(33)',
                            size: 14.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 5.w),
                          RatingBar.readOnly(
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            initialRating: 4,
                            maxRating: 5,
                            size: 18.sp,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            const Divider(thickness: 1, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
