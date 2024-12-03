import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/screens/client_screens/Service_Details/widgets/provider_container.dart';
import 'package:makhdom/screens/client_screens/Service_Details/widgets/service_details_text.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_router.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../../../generated/locale_keys.g.dart';
import '../drawer/custom_drawer.dart';
import '../Service_Details/widgets/service_details_container.dart';
import '../payment/payment.dart';

class DirectServiceDetails extends StatelessWidget {
  const DirectServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(langContext: context),
      bottomNavigationBar: const CustomBottomNav(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          title: LocaleKeys.service_details.tr(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ServiceContainer(),
            const ServiceDetailsText(),
            const ProviderContainer(),
            AppButton(
              onPressed: () {
                AppRouter.navigateTo(context, const Payment());
              },
              width: 343.w,
              child:  AppText(
                text: LocaleKeys.request_service.tr(),
                color: AppColors.secondray,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
