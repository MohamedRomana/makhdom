// ignore_for_file: deprecated_member_use
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_button.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/core/widgets/custom_app_bar.dart';
import 'package:makhdom/core/widgets/custom_bottom_nav.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/app_router.dart';
import '../drawer/custom_drawer.dart';
import '../payment/payment.dart';
import 'widgets/custom_date.dart';
import 'widgets/custom_time.dart';
import 'widgets/provider_container.dart';
import 'widgets/service_details_container.dart';
import 'widgets/service_details_text.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key});

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
              title: LocaleKeys.service_details.tr(),
            ),
          ),
          bottomNavigationBar: const CustomBottomNav(),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(24.sp),
              child: Column(
                children: [
                  const ServiceContainer(),
                  const ServiceDetailsText(),
                  const CustomDate(),
                  const CustomTime(),
                  const Divider(thickness: 1, color: Colors.grey),
                  const ProviderContainer(),
                  AppButton(
                    onPressed: () {
                      AppRouter.navigateTo(context, const Payment());
                    },
                    width: 343.w,
                    child: AppText(
                      text: LocaleKeys.request_service.tr(),
                      color: AppColors.secondray,
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
