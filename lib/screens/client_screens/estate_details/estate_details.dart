import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../drawer/custom_drawer.dart';
import 'widgets/estate_button.dart';
import 'widgets/estate_description.dart';
import 'widgets/estate_details_container.dart';
import 'widgets/estate_location.dart';
import 'widgets/estate_location_and_price.dart';

class EstateDetails extends StatelessWidget {
  const EstateDetails({super.key});

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
          title: 'تفاصيل العقار',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: const Column(
            children: [
              EstateLocationAndPrice(),
              EstateDetailsContainer(),
              EstateDescription(),
              EstateLocation(),
              EstateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
