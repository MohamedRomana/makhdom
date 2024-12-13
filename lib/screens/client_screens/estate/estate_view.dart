import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_cached.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import '../../../core/widgets/app_router.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../../../generated/locale_keys.g.dart';
import '../drawer/custom_drawer.dart';
import '../estate_details/estate_details.dart';
import 'widgets/floating_estate_location.dart';
import 'widgets/real_estate_shimmer.dart';

class EstateView extends StatefulWidget {
  const EstateView({super.key});

  @override
  State<EstateView> createState() => _EstateViewState();
}

class _EstateViewState extends State<EstateView> {
  @override
  void initState() {
    AppCubit.get(context).getDepartments();
    super.initState();
  }

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
              title: LocaleKeys.real_estate.tr(),
            ),
          ),
          floatingActionButton: AppCubit.get(context).allDepartmentModel.isEmpty
              ? null
              : const FloatingEstateLocation(),
          body: state is GetDepartmentLoading &&
                  AppCubit.get(context).allDepartmentModel.isEmpty
              ? const RealEstateShimmer()
              : ListView.separated(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 16.h),
                  itemCount: AppCubit.get(context).allDepartmentModel.length,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                    onTap: () {
                      AppRouter.navigateTo(
                          context,
                          EstateDetails(
                            id: AppCubit.get(context)
                                .allDepartmentModel[index]
                                .id,
                          ));
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 10.w),
                      height: 108.h,
                      width: 327.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 5.r,
                            spreadRadius: 1.r,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24.r),
                            child: AppCachedImage(
                              image: AppCubit.get(context)
                                  .allDepartmentModel[index]
                                  .firstImage,
                              height: 80.h,
                              width: 75.w,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: AppCubit.get(context)
                                    .allDepartmentModel[index]
                                    .title,
                                size: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.grey,
                                    size: 14.sp,
                                  ),
                                  AppText(
                                    text: AppCubit.get(context)
                                        .allDepartmentModel[index]
                                        .address,
                                    size: 12.sp,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/cook.svg',
                                    height: 15.sp,
                                  ),
                                  SizedBox(width: 5.h),
                                  AppText(
                                    text: AppCubit.get(context)
                                        .allDepartmentModel[index]
                                        .area
                                        .toString(),
                                    color: Colors.grey,
                                    size: 14.sp,
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/wash.svg',
                                    height: 15.sp,
                                  ),
                                  SizedBox(width: 5.h),
                                  AppText(
                                    text: AppCubit.get(context)
                                        .allDepartmentModel[index]
                                        .bathroomsCount
                                        .toString(),
                                    color: Colors.grey,
                                    size: 14.sp,
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/bed.svg',
                                    height: 15.sp,
                                  ),
                                  SizedBox(width: 5.h),
                                  AppText(
                                    text: AppCubit.get(context)
                                        .allDepartmentModel[index]
                                        .roomsCount
                                        .toString(),
                                    color: Colors.grey,
                                    size: 14.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: AppText(
                              text: AppCubit.get(context)
                                  .allDepartmentModel[index]
                                  .price
                                  .toString(),
                              size: 16.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColors.text,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: AppText(
                              text: ' ر.س',
                              size: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
