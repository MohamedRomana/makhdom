import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_cached.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/core/widgets/custom_app_bar.dart';
import 'package:makhdom/core/widgets/custom_bottom_nav.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import 'package:makhdom/screens/client_screens/drawer/custom_drawer.dart';
import 'package:makhdom/screens/client_screens/Service_Details/service_details.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/app_text.dart';
import 'widgets/sorts_floating.dart';

class ScheduledServices extends StatelessWidget {
  const ScheduledServices({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          drawer: CustomDrawer(langContext: context),
          bottomNavigationBar: const CustomBottomNav(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: CustomAppBar(
              scaffoldKey: scaffoldKey,
              title: LocaleKeys.scheduled_services.tr(),
            ),
          ),
          floatingActionButton: const SortsFloating(isService: true),
          body: state is GetServicesLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))
              : ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    SizedBox(height: 16.h),
                itemCount: AppCubit.get(context).services.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      AppRouter.navigateTo(
                          context,
                          ServiceDetails(
                            id: AppCubit.get(context).services[index]['id'],
                            isHaveTime: true,
                          ));
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      height: 80.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: AppCachedImage(
                                image: AppCubit.get(context).services[index]
                                    ["first_image"],
                                height: 48.h,
                                width: 48.w,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  text: AppCubit.get(context)
                                      .services[index]['title'],
                                  size: 14.sp,
                                  color: AppColors.text,
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset('assets/svg/bag.svg'),
                                    SizedBox(width: 4.w),
                                    AppText(
                                      text: AppCubit.get(context)
                                          .services[index]['section_title'],
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
                                          .services[index]['price']
                                          .toString(),
                                      size: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff5669FF),
                                    ),
                                    AppText(
                                      lines: 1,
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
              ),
        );
      },
    );
  }
}
