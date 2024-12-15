import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../drawer/custom_drawer.dart';
import 'widgets/estate_button.dart';
import 'widgets/estate_description.dart';
import 'widgets/estate_details_container.dart';
import 'widgets/estate_location.dart';
import 'widgets/estate_location_and_price.dart';

class EstateDetails extends StatefulWidget {
  final int id;
  const EstateDetails({super.key, required this.id});

  @override
  State<EstateDetails> createState() => _EstateDetailsState();
}

class _EstateDetailsState extends State<EstateDetails> {
  @override
  void initState() {
    AppCubit.get(context).showDepartmenr(departmentId: widget.id.toString());
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
              title: LocaleKeys.property_details.tr(),
            ),
          ),
          body: state is ShowDepartmentLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                )
              : SingleChildScrollView(
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
      },
    );
  }
}
