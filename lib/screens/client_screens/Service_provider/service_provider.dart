import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../../../generated/locale_keys.g.dart';
import '../drawer/custom_drawer.dart';
import 'widgets/complete_orders.dart';
import 'widgets/provider_name_and_rating.dart';
import 'widgets/services_provided.dart';

class ServiceProvider extends StatefulWidget {
  final int providerId;
  const ServiceProvider({super.key, required this.providerId});

  @override
  State<ServiceProvider> createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  @override
  void initState() {
    AppCubit.get(context)
        .showProvider(providerId: widget.providerId.toString());
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
              title: LocaleKeys.service_provider.tr(),
            ),
          ),
          body: state is ShowProviderLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
                  child: const Column(
                    children: [
                      ProviderNameAndRating(),
                      CompleteOrders(),
                      ServicesProvided(),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
