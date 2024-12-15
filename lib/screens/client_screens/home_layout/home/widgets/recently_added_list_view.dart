import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_cached.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/app_router.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../Service_Details/service_details.dart';

class RecentlyAddedListView extends StatelessWidget {
  const RecentlyAddedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              top: 8.h,
              bottom: 8.h,
              text: LocaleKeys.recently_added.tr(),
              color: AppColors.primary,
              size: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: AppCubit.get(context).homeServices.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    AppRouter.navigateTo(
                        context,
                        ServiceDetails(
                          id: AppCubit.get(context).homeServices[index]['id'],
                          isHaveTime: true,
                        ));
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    height: 80.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: AppCachedImage(
                              image: AppCubit.get(context).homeServices[index]
                                  ['first_image'],
                              height: 48.h,
                              width: 48.w,
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                text: AppCubit.get(context).homeServices[index]
                                    ['title'],
                                size: 14.sp,
                                color: AppColors.text,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  SvgPicture.asset('assets/svg/bag.svg'),
                                  SizedBox(width: 4.w),
                                  AppText(
                                    text: AppCubit.get(context)
                                        .homeServices[index]['section_title'],
                                    size: 12.sp,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 100.w),
                                  AppText(
                                    text: '${LocaleKeys.price.tr()}: ',
                                    size: 12.sp,
                                    color: AppColors.text,
                                  ),
                                  AppText(
                                    text: AppCubit.get(context)
                                        .homeServices[index]['price']
                                        .toString(),
                                    size: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff5669FF),
                                  ),
                                  AppText(
                                    text: ' ${LocaleKeys.currency.tr()}',
                                    size: 12.sp,
                                    color: AppColors.text,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}
