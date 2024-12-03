import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/screens/client_screens/drawer/chat/chat_view.dart';
import 'package:makhdom/screens/client_screens/drawer/contact_us/contact_us.dart';
import 'package:makhdom/screens/client_screens/drawer/privacy_policy/privacy_policy.dart';
import 'package:makhdom/screens/client_screens/home_layout/home_layout.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/app_text.dart';
import '../../../generated/locale_keys.g.dart';
import 'about_us/about_us.dart';
import 'widgets/drawer_logo.dart';
import 'widgets/logout_container.dart';
import 'widgets/positioned_pop.dart';

class CustomDrawer extends StatelessWidget {
  final BuildContext langContext;
  const CustomDrawer({super.key, required this.langContext});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300.w,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          SizedBox(height: 57.h),
          Container(
            height: 815.h,
            width: 283.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(25.r),
                bottomEnd: Radius.circular(25.r),
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const DrawerLogo(),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 57.h,
                      start: 20.w,
                      end: 20.w,
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            AppRouter.pop(context);
                            AppCubit.get(context).changeScreenIndex(index: 0);
                            AppRouter.navigateTo(context, const HomeLayout());
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.settings,
                                size: 20.sp,
                                color: AppColors.secondray,
                              ),
                              SizedBox(width: 5.w),
                              AppText(
                                text: LocaleKeys.home.tr(),
                                size: 17.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20.sp,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: (){
                            AppRouter.pop(context);
                            AppRouter.navigateTo(context, const ChatView());
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.chat_bubble_2,
                                size: 20.sp,
                                color: AppColors.secondray,
                              ),
                              SizedBox(width: 5.w),
                              AppText(
                                text: LocaleKeys.chat.tr(),
                                size: 17.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20.sp,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () {
                            AppRouter.pop(context);
                            AppRouter.navigateTo(context, const AboutUs());
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.person_2,
                                size: 20.sp,
                                color: AppColors.secondray,
                              ),
                              SizedBox(width: 5.w),
                              AppText(
                                text: LocaleKeys.aboutus.tr(),
                                size: 17.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20.sp,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () {
                            AppRouter.pop(context);
                            AppRouter.navigateTo(
                                context, const PrivacyPolicy());
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Row(
                            children: [
                              Icon(
                                Icons.report_outlined,
                                size: 20.sp,
                                color: AppColors.secondray,
                              ),
                              SizedBox(width: 5.w),
                              AppText(
                                text: LocaleKeys.privacyPolicy.tr(),
                                size: 17.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20.sp,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () {
                            AppRouter.pop(context);
                            AppRouter.navigateTo(context, const ContactUs());
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.mail,
                                size: 20.sp,
                                color: AppColors.secondray,
                              ),
                              SizedBox(width: 5.w),
                              AppText(
                                text: LocaleKeys.contactUs.tr(),
                                size: 17.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20.sp,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.globe,
                              size: 20.sp,
                              color: AppColors.secondray,
                            ),
                            SizedBox(width: 5.w),
                            AppText(
                              text: LocaleKeys.english.tr(),
                              size: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            const Spacer(),
                            Transform.scale(
                              scale: 0.8.r,
                              child: Switch(
                                trackOutlineColor: const WidgetStatePropertyAll(
                                    Colors.transparent),
                                activeColor: AppColors.primary,
                                inactiveThumbColor: AppColors.primary,
                                inactiveTrackColor: AppColors.secondray,
                                value: CacheHelper.getLang() == "en"
                                    ? true
                                    : false,
                                onChanged: (value) {
                                  if (CacheHelper.getLang() == "ar") {
                                    CacheHelper.setLang("en");
                                    langContext.setLocale(const Locale("en"));
                                    AppRouter.pop(context);
                                  } else {
                                    CacheHelper.setLang("ar");
                                    langContext.setLocale(const Locale("ar"));
                                    AppRouter.pop(context);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const PositionedPop(),
          const LogOutContainer()
        ],
      ),
    );
  }
}
