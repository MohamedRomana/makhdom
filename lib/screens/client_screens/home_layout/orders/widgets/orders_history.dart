import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/screens/client_screens/home_layout/orders/widgets/orders_shimmer.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/app_router.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../order_details/order_details.dart';
import 'empty_orders.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({
    super.key,
  });

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  void initState() {
    AppCubit.get(context).getOrders(status: 'finish');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return state is GetOrdersLoading
            ? const CustomOrdersShimmer()
            : AppCubit.get(context).ordersList.isEmpty
                ? const EmptyOrders()
                : ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 16.h),
                    itemCount: AppCubit.get(context).ordersList.length,
                    itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        AppRouter.navigateTo(
                            context,
                            OrderDetails(
                              id: AppCubit.get(context).ordersList[index]['id'],
                            ));
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        width: 343.w,
                        decoration: BoxDecoration(
                          color: AppColors.secondray.withOpacity(0.33),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text:
                                        'رقم الطلب: ${AppCubit.get(context).ordersList[index]['id']}',
                                    size: 16.sp,
                                    family: 'DINArabic-Medium',
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.grey,
                                        size: 14.sp,
                                      ),
                                      AppText(
                                        text: AppCubit.get(context)
                                                .ordersList[index]
                                            ['order_date_time'],
                                        size: 14.sp,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              AppText(
                                text:
                                    'اسم الخدمة: ${AppCubit.get(context).ordersList[index]['section_title']}',
                                size: 16.sp,
                                family: 'DINArabic-Light',
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Container(
                                  height: 24.h,
                                  width: 83.w,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(30.r),
                                    border: Border.all(
                                      color: const Color(0xffFF8800),
                                    ),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      text: AppCubit.get(context)
                                          .ordersList[index]['status_f'],
                                      size: 13.sp,
                                      color: const Color(0xffFF8800),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
      },
    );
  }
}
