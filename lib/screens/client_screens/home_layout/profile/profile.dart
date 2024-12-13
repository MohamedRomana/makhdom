import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/cache/cache_helper.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/alert_dialog.dart';
import 'package:makhdom/core/widgets/app_cached.dart';
import 'package:makhdom/core/widgets/app_input.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/core/widgets/flash_message.dart';
import 'package:makhdom/screens/auth/data/auth_cubit.dart';
import 'package:makhdom/screens/client_screens/edit_profile.dart/edit_profile.dart';
import 'package:makhdom/screens/client_screens/home_layout/profile/widgets/custom_profile_shimmer.dart';
import 'package:makhdom/screens/client_screens/home_layout/profile/widgets/delete_account_dialog.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/login_first.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../drawer/custom_drawer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    AppCubit.get(context).showUser();
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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: CustomAppBar(
              scaffoldKey: scaffoldKey,
              title: LocaleKeys.profile.tr(),
              isHomeLayout: true,
            ),
          ),
          body: CacheHelper.getUserId() == ""
              ? const LogiFirst()
              : state is ShowUserLoading &&
                      AppCubit.get(context).showUserAccount.isEmpty
                  ? const CustomProfileShimmer()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 30.h, horizontal: 10.w),
                      child: Column(
                        children: [
                          Container(
                            height: 120.h,
                            width: 120.w,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: AppCachedImage(
                              image: AppCubit.get(context)
                                      .showUserAccount['avatar'] ??
                                  "",
                            ),
                          ),
                          SizedBox(height: 30.h),
                          AppInput(
                            filled: true,
                            isEnabled: false,
                            color: AppColors.field,
                            disableBorderColor: Colors.grey,
                            prefixIcon: AppText(
                              top: 16.h,
                              bottom: 16.h,
                              start: 16.w,
                              end: 16.w,
                              text: LocaleKeys.name.tr(),
                              color: Colors.black,
                            ),
                            suffixIcon: AppText(
                              top: 16.h,
                              bottom: 16.h,
                              start: 16.w,
                              end: 16.w,
                              text: AppCubit.get(context)
                                      .showUserAccount['first_name'] ??
                                  "",
                              color: Colors.black.withOpacity(0.6.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: AppInput(
                              filled: true,
                              isEnabled: false,
                              color: AppColors.field,
                              disableBorderColor: Colors.grey,
                              prefixIcon: AppText(
                                top: 16.h,
                                bottom: 16.h,
                                start: 16.w,
                                end: 16.w,
                                text: LocaleKeys.phone.tr(),
                                color: Colors.black,
                              ),
                              suffixIcon: AppText(
                                top: 16.h,
                                bottom: 16.h,
                                start: 16.w,
                                end: 16.w,
                                text: AppCubit.get(context)
                                        .showUserAccount['phone'] ??
                                    "",
                                color: Colors.black.withOpacity(0.6.sp),
                              ),
                            ),
                          ),
                          AppInput(
                            filled: true,
                            isEnabled: false,
                            color: AppColors.field,
                            disableBorderColor: Colors.grey,
                            prefixIcon: AppText(
                              top: 16.h,
                              bottom: 16.h,
                              start: 16.w,
                              end: 16.w,
                              text: LocaleKeys.city.tr(),
                              color: Colors.black,
                            ),
                            suffixIcon: AppText(
                              top: 16.h,
                              bottom: 16.h,
                              start: 16.w,
                              end: 16.w,
                              text: AppCubit.get(context)
                                      .showUserAccount['city'] ??
                                  "",
                              color: Colors.black.withOpacity(0.6.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 25.h),
                            child: AppButton(
                              onPressed: () {
                                AppRouter.navigateTo(
                                    context, const EditProfile());
                              },
                              width: 343.w,
                              color: AppColors.primary,
                              child: AppText(
                                text: LocaleKeys.edit_profile.tr(),
                                color: AppColors.secondray,
                              ),
                            ),
                          ),
                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is DeleteAccountLoading) {
                                showLoadingDialog(
                                    context: context, isLottie: true);
                              }
                              if (state is DeleteAccountSuccess) {
                                AppCubit.get(context).showUserAccount.clear();
                                AppRouter.pop(context);
                                AppRouter.pop(context);
                                AppCubit.get(context)
                                    .changeScreenIndex(index: 0);
                                showFlashMessage(
                                  message: state.message,
                                  type: FlashMessageType.success,
                                  context: context,
                                );
                              } else if (state is DeleteAccountFailure) {
                                showFlashMessage(
                                  message: state.error,
                                  type: FlashMessageType.error,
                                  context: context,
                                );
                              }
                            },
                            builder: (context, state) {
                              return AppButton(
                                onPressed: () {
                                  customAlertDialog(
                                    context: context,
                                    child: const DeleteAccountDialog(),
                                  );
                                },
                                color: const Color(0xffFF0909),
                                width: 343.w,
                                child: AppText(
                                  text: LocaleKeys.delete_account.tr(),
                                  color: Colors.white,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
        );
      },
    );
  }
}
