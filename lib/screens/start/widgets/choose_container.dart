import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/app_text.dart';

class CustomChooseContainer extends StatelessWidget {
  final void Function() firstTap;
  final void Function() secoundTap;
  final String firstText;
  final String secoundText;
  final bool isType;

  const CustomChooseContainer({
    super.key,
    required this.firstTap,
    required this.secoundTap,
    required this.firstText,
    required this.secoundText,
    this.isType = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Column(
          children: [
            InkWell(
              onTap: firstTap,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                height: 150.h,
                width: 311.w,
                decoration: BoxDecoration(
                  color: AppColors.secondray,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -5,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/img/human1.png',
                              height: 120.h,
                              width: 105.w,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 50,
                        bottom: 50,
                        left: 50,
                        child: Center(
                          child: AppText(
                            text: LocaleKeys.service_provider.tr(),
                            size: 26.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            InkWell(
              onTap: secoundTap,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                height: 150.h,
                width: 311.w,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -5,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/img/human2.png',
                              height: 120.h,
                              width: 105.w,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 50,
                        bottom: 50,
                        left: 50,
                        child: Center(
                          child: AppText(
                            text: LocaleKeys.search_service.tr(),
                            size: 26.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
