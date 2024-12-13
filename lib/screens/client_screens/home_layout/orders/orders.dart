import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/cache/cache_helper.dart';
import 'package:makhdom/core/constants/colors.dart';
import '../../../../core/service/cubit/app_cubit.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/login_first.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../drawer/custom_drawer.dart';
import 'widgets/current_requests.dart';
import 'widgets/orders_history.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      return Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(langContext: context),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: CustomAppBar(
            scaffoldKey: scaffoldKey,
            title: LocaleKeys.orders.tr(),
            isHomeLayout: true,
          ),
        ),
        body: CacheHelper.getUserId() == ""
            ? const LogiFirst()
            : DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        indicatorColor: AppColors.primary,
                        labelColor: AppColors.text,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                        tabs: const [
                          Tab(
                            text: 'طلبات حالية',
                          ),
                          Tab(
                            text: 'سجل الطلبات',
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          CurrentRequests(),
                          OrderHistory(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
