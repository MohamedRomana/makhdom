import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makhdom/core/widgets/app_cached.dart';
import '../../../core/constants/colors.dart';
import '../../../core/service/cubit/app_cubit.dart';
import '../../../core/widgets/app_router.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../../../generated/locale_keys.g.dart';
import '../Service_Details/service_details.dart';
import '../drawer/custom_drawer.dart';
import 'widgets/empty_search.dart';
import 'widgets/floating_location.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      return Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(langContext: context),
        bottomNavigationBar: const CustomBottomNav(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: CustomAppBar(
            scaffoldKey: scaffoldKey,
            title: LocaleKeys.searchresults.tr(),
          ),
        ),
        floatingActionButton: AppCubit.get(context).searchResult.isEmpty
            ? null
            : const FloatingLocation(),
        body: state is GetSearchLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.primary,
              ))
            : AppCubit.get(context).searchResult.isEmpty
                ? const EmptySearch()
                : ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemCount: AppCubit.get(context).searchResult.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          AppRouter.navigateTo(
                            context,
                            ServiceDetails(
                              id: AppCubit.get(context).searchResult[index].id,
                              isHaveTime: true,
                            ),
                          );
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
                                  image: AppCubit.get(context)
                                      .searchResult[index]
                                      .firstImage,
                                      height: 48.h,
                                      width: 48.w,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                      text: AppCubit.get(context)
                                          .searchResult[index]
                                          .title,
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
                                              .searchResult[index]
                                              .type,
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
                                              .searchResult[index]
                                              .price
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
                  ),
      );
    });
  }
}
