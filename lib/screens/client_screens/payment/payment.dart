import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_button.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/core/widgets/custom_app_bar.dart';
import 'package:makhdom/core/widgets/custom_bottom_nav.dart';
import 'package:makhdom/core/widgets/flash_message.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../core/widgets/app_router.dart';
import '../drawer/custom_drawer.dart';
import '../home_layout/home_layout.dart';
import 'widgets/custom_pay_bottom_sheet.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is StoreOrderSuccess) {
          AppCubit.get(context).changeScreenIndex(index: 1);
          showFlashMessage(
            message: 'Success',
            type: FlashMessageType.success,
            context: context,
          );
          AppRouter.navigateAndFinish(context, const HomeLayout());
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => const CutomPayBottomSheet(),
          );
        } else if (state is StoreOrderFailure) {
          showFlashMessage(
            message: state.error,
            type: FlashMessageType.error,
            context: context,
          );
        }
      },
      builder: (context, state) {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: LocaleKeys.choose_payment_method.tr(),
                      size: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 8.w),
                    const Divider(thickness: 1, color: Colors.grey),
                    SizedBox(height: 18.h),
                    InkWell(
                      onTap: () {
                        if (AppCubit.get(context).paymentIndex == 0) {
                          AppCubit.get(context).changePaymentIndex(index: -1);
                        } else {
                          AppCubit.get(context).changePaymentIndex(index: 0);
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Row(
                        children: [
                          Image.asset('assets/img/cash.png'),
                          SizedBox(width: 8.w),
                          AppText(
                            text: 'Cash',
                            size: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          const Spacer(),
                          Container(
                            height: 25.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppCubit.get(context).paymentIndex == 0
                                  ? AppColors.secondray
                                  : Colors.transparent,
                              border: Border.all(color: AppColors.secondray),
                            ),
                            child: Icon(
                              Icons.done,
                              color: AppCubit.get(context).paymentIndex == 0
                                  ? Colors.white
                                  : Colors.transparent,
                              size: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 21.h),
                    InkWell(
                      onTap: () {
                        if (AppCubit.get(context).paymentIndex == 1) {
                          AppCubit.get(context).changePaymentIndex(index: -1);
                        } else {
                          AppCubit.get(context).changePaymentIndex(index: 1);
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Row(
                        children: [
                          Image.asset('assets/img/visa.png'),
                          SizedBox(width: 8.w),
                          AppText(
                            text: 'Online',
                            size: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          const Spacer(),
                          Container(
                            height: 25.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppCubit.get(context).paymentIndex == 1
                                  ? AppColors.secondray
                                  : Colors.transparent,
                              border: Border.all(color: AppColors.secondray),
                            ),
                            child: Icon(
                              Icons.done,
                              color: AppCubit.get(context).paymentIndex == 1
                                  ? Colors.white
                                  : Colors.transparent,
                              size: 16.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                AppButton(
                  onPressed: () {
                    if (AppCubit.get(context).paymentIndex == -1) {
                      showFlashMessage(
                          message: 'مطلوب اختيار طريقه دفع',
                          type: FlashMessageType.warning,
                          context: context);
                    } else {
                      if (AppCubit.get(context).dateList.isNotEmpty) {
                        AppCubit.get(context).storeOrder(
                            providerId: AppCubit.get(context)
                                .servicesList['saler_id']
                                .toString(),
                            serviceId: AppCubit.get(context)
                                .servicesList['id']
                                .toString(),
                            subTotal: AppCubit.get(context)
                                .servicesList['price']
                                .toString(),
                            valueAdded:
                                AppCubit.get(context).valueAdded['value_added'].toString(),
                            isScheduled: true,
                            date:
                                AppCubit.get(context).storeOrderList['date'] ??
                                    "",
                            time:
                                AppCubit.get(context).storeOrderList['time'] ??
                                    "");
                      } else {
                        AppCubit.get(context).storeOrder(
                          providerId: AppCubit.get(context)
                              .servicesList['saler_id']
                              .toString(),
                          serviceId: AppCubit.get(context)
                              .servicesList['id']
                              .toString(),
                          subTotal: AppCubit.get(context)
                              .servicesList['price']
                              .toString(),
                          valueAdded:
                              AppCubit.get(context).valueAdded['value_added'].toString(),
                        );
                      }
                    }
                  },
                  width: 343.w,
                  child: state is StoreOrderLoading
                      ? const CircularProgressIndicator(
                          color: AppColors.secondray,
                        )
                      : AppText(
                          text: LocaleKeys.confirm_request.tr(),
                          color: AppColors.secondray,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
