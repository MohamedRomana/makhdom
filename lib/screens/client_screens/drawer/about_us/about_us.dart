import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_bottom_nav.dart';
import '../../../../generated/locale_keys.g.dart';
import '../custom_drawer.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  void initState() {
    AppCubit.get(context).aboutUs();
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
              title: LocaleKeys.aboutus.tr(),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
            child: Column(
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: const DecorationImage(
                      image: AssetImage('assets/img/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
                AppText(
                  text: AppCubit.get(context).aboutUsTitle,
                  lines: 100,
                  size: 16.sp,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
