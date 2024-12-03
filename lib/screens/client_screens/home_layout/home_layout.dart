// ignore_for_file: deprecated_member_use
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/colors.dart';
import '../../../core/service/cubit/app_cubit.dart';
import '../../../generated/locale_keys.g.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: SizedBox(
            height: 65.h,
            child: BottomNavigationBar(
              backgroundColor: AppColors.primary,
              selectedItemColor: AppColors.secondray,
              unselectedItemColor: const Color(0xff787F9E),
              currentIndex: AppCubit.get(context).screenIndex,
              showUnselectedLabels: true,
              elevation: 0,
              enableFeedback: true,
              selectedLabelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.secondray,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff787F9E),
              ),
              onTap: (index) {
                AppCubit.get(context).changeScreenIndex(index: index);
              },
              items: [
                BottomNavigationBarItem(
                    backgroundColor: AppColors.primary,
                    icon: SvgPicture.asset(
                      'assets/svg/home.svg',
                      height: 20.44.h,
                      width: 20.44.w,
                      fit: BoxFit.cover,
                      color: const Color(0xff787F9E),
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/svg/home.svg',
                      height: 20.44.h,
                      width: 20.44.w,
                      fit: BoxFit.cover,
                      color: AppColors.secondray,
                    ),
                    label: LocaleKeys.home.tr()),
                BottomNavigationBarItem(
                    backgroundColor: AppColors.primary,
                    icon: SvgPicture.asset(
                      'assets/svg/orders.svg',
                      height: 20.44.h,
                      width: 20.44.w,
                      fit: BoxFit.cover,
                      color: const Color(0xff787F9E),
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/svg/orders.svg',
                      height: 20.44.h,
                      width: 20.44.w,
                      fit: BoxFit.cover,
                      color: AppColors.secondray,
                    ),
                    label: LocaleKeys.orders.tr()),
                BottomNavigationBarItem(
                    backgroundColor: AppColors.primary,
                    icon: SvgPicture.asset(
                      'assets/svg/profile.svg',
                      height: 20.44.h,
                      width: 20.44.w,
                      fit: BoxFit.cover,
                      color: const Color(0xff787F9E),
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/svg/profile.svg',
                      height: 20.44.h,
                      width: 20.44.w,
                      fit: BoxFit.cover,
                      color: AppColors.secondray,
                    ),
                    label: LocaleKeys.profile.tr()),
                BottomNavigationBarItem(
                    backgroundColor: AppColors.primary,
                    icon: SvgPicture.asset(
                      'assets/svg/notifications.svg',
                      height: 20.44.h,
                      width: 20.44.w,
                      fit: BoxFit.cover,
                      color: const Color(0xff787F9E),
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/svg/notifications.svg',
                      height: 20.44.h,
                      width: 20.44.w,
                      fit: BoxFit.cover,
                      color: AppColors.secondray,
                    ),
                    label: LocaleKeys.notifications.tr()),
              ],
            ),
          ),
          body:
              AppCubit.get(context).screens[AppCubit.get(context).screenIndex],
        );
      },
    );
  }
}
