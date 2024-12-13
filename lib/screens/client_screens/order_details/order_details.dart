import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../drawer/custom_drawer.dart';
import 'widgets/order_details_container.dart';

class OrderDetails extends StatefulWidget {
  final int id;
  const OrderDetails({super.key, required this.id});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  void initState() {
    AppCubit.get(context).showOrder(orderId: widget.id.toString());
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
              title: 'تفاصيل الطلب',
            ),
          ),
          body: state is ShowOrderLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))
              : Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                  child: const Column(
                    children: [
                      OrderDetailsContainer(),
                      Spacer(),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
