import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/widgets/app_button.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/core/widgets/custom_app_bar.dart';
import 'package:makhdom/core/widgets/custom_bottom_nav.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../drawer/custom_drawer.dart';
import 'widgets/custom_pay.dart';
import 'widgets/custom_pay_bottom_sheet.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(langContext: context),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          title: LocaleKeys.payment.tr(),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 55.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomPay(),
            const Spacer(),
            AppButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const CutomPayBottomSheet(),
                );
              },
              width: 343.w,
              child: AppText(
                text: LocaleKeys.confirm_request.tr(),
                color: AppColors.secondray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
