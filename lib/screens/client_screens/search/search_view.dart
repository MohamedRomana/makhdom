import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_button.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/screens/client_screens/search_result/search_result.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../../../generated/locale_keys.g.dart';
import '../drawer/custom_drawer.dart';
import 'widgets/search_fields.dart';

final _serviceNameController = TextEditingController();
final _serviceTypeController = TextEditingController();
final _cityController = TextEditingController();
final _serviceRateController = TextEditingController();

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    _serviceNameController.clear();
    _serviceTypeController.clear(); 
    _cityController.clear();
    _serviceRateController.clear();
    super.initState();
  }
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
          title: LocaleKeys.search.tr(),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            children: [
              SearchFields(
                serviceNameController: _serviceNameController,
                serviceTypeController: _serviceTypeController,
                cityController: _cityController,
                rateController: _serviceRateController,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
                child: AppButton(
                  onPressed: () {
                    AppCubit.get(context).getSearch(
                      title: _serviceNameController.text,
                      filter: _serviceRateController.text ==
                              LocaleKeys.sort_by_highest_rating
                          ? "max_rate"
                          : _serviceRateController.text ==
                                  LocaleKeys.sort_by_lowest_price.tr()
                              ? "min_rate"
                              : "",
                    );
                    AppRouter.navigateAndPop(context, const SearchResult());
                  },
                  width: 343.w,
                  child: const AppText(
                    text: 'بحث',
                    color: AppColors.secondray,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
