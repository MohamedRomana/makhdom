import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_cached.dart';
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
        AppRouter.navigateTo(context,  ServiceProvider(providerId: AppCubit.get(context).servicesList['saler_id'],));
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: AppCachedImage(
                    image: AppCubit.get(context).servicesList['saler_avatar'] ??
                        "",
                    height: 48.h,
                    width: 48.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text:
                            AppCubit.get(context).servicesList['saler_name'] ??
                                "",
                        size: 14.sp,
                        color: AppColors.text,
                      ),
                      Row(
                        children: [
                          AppText(
                            text: AppCubit.get(context)
                                .servicesList['saler_rate']
                                .toString(),
                            size: 14.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 5.w),
                          RatingBar.readOnly(
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            initialRating: AppCubit.get(context)
                                .servicesList['saler_rate']
                                .toDouble(),
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
