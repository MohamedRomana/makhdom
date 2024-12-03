import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/screens/client_screens/search/search_view.dart';
import '../constants/colors.dart';
import 'app_text.dart';

final _formKey = GlobalKey<FormState>();
final _serviceNameController = TextEditingController();
final _serviceTypeController = TextEditingController();
final _cityController = TextEditingController();
final _serviceRateController = TextEditingController();

class CustomAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;
  final bool? isHomeLayout;

  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
    required this.title,
    this.isHomeLayout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 52.h,
        bottom: 16.h,
        right: 16.w,
        left: 16.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => scaffoldKey.currentState!.openDrawer(),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: SvgPicture.asset('assets/svg/drawer.svg'),
          ),
          AppText(
            text: title,
            color: Colors.white,
            size: 18.sp,
            fontWeight: FontWeight.w400,
          ),
          if (isHomeLayout!) ...{
            IconButton(
              onPressed: () {
                AppRouter.navigateTo(
                  context,
                  SearchView(
                    formKey: _formKey,
                    serviceNameController: _serviceNameController,
                    serviceTypeController: _serviceTypeController,
                    cityController: _cityController,
                    serviceRateController: _serviceRateController,
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                size: 24.sp,
                color: AppColors.secondray,
              ),
            ),
          } else ...{
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    AppRouter.navigateTo(
                      context,
                      SearchView(
                        formKey: _formKey,
                        serviceNameController: _serviceNameController,
                        serviceTypeController: _serviceTypeController,
                        cityController: _cityController,
                        serviceRateController: _serviceRateController,
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                    size: 24.sp,
                    color: AppColors.secondray,
                  ),
                ),
                SizedBox(width: 6.w),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 24.sp,
                      color: AppColors.secondray,
                    ))
              ],
            ),
          }
        ],
      ),
    );
  }
}
