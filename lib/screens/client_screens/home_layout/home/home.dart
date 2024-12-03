// ignore_for_file: deprecated_member_use
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../drawer/custom_drawer.dart';
import 'widgets/estate_container.dart';
import 'widgets/recently_added_list_view.dart';
import 'widgets/services_row.dart';
import 'widgets/swiper_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
          title: LocaleKeys.home.tr(),
          isHomeLayout: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Column(
            children: [
              SwiperContainer(),
              ServicesRow(),
              EstateContainer(),
              RecentlyAddedListView()
            ],
          ),
        ),
      ),
    );
  }
}
