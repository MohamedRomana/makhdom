import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/screens/auth/views/login/login.dart';
import '../../../generated/locale_keys.g.dart';
import '../../auth/views/widgets/auth_header.dart';
import '../widgets/choose_container.dart';

class TypeScreen extends StatelessWidget {
  const TypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100.h),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              CustomAuthHeader(text: LocaleKeys.choose_membership.tr()),
              CustomChooseContainer(
                isType: true,
                firstText: LocaleKeys.customer.tr(),
                secoundText: LocaleKeys.representative.tr(),
                firstTap: () {
                  AppRouter.navigateTo(
                      context,
                      const LogIn(
                        type: 'client',
                      ));
                },
                secoundTap: () {
                  AppRouter.navigateTo(
                    context,
                    const LogIn(
                      type: 'saler',
                    ),
                  );
                },
              ),
              InkWell(
                onTap: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: AppText(
                  top: 143.h,
                  text: LocaleKeys.skip_to_home.tr(),
                  fontWeight: FontWeight.w500,
                  size: 16.sp,
                  color: AppColors.boldText,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
