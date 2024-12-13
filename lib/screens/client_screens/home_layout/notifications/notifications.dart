import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import 'package:makhdom/screens/client_screens/drawer/chat/chat_view.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/login_first.dart';
import '../../drawer/custom_drawer.dart';
import 'widgets/custom_noti_shimmer.dart';
import 'widgets/empty_notification.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    AppCubit.get(context).getNotifications();
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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: CustomAppBar(
              scaffoldKey: scaffoldKey,
              title: LocaleKeys.notifications.tr(),
              isHomeLayout: true,
            ),
          ),
          body: CacheHelper.getUserId() == ""
              ? const LogiFirst()
              : state is GetNotificationsLoading
                  ? const CustomNotificationShimmer()
                  : AppCubit.get(context).notificationModel.isEmpty
                      ? const EmptyNotification()
                      : ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 16.h),
                          padding: EdgeInsets.symmetric(
                              vertical: 24.h, horizontal: 16.w),
                          itemCount:
                              AppCubit.get(context).notificationModel.length,
                          itemBuilder: (context, index) => Slidable(
                            key: const ValueKey(0),
                            endActionPane: ActionPane(
                              motion: const StretchMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    AppCubit.get(context).deleteNotification(
                                      notificationId: AppCubit.get(context)
                                          .notificationModel[index]
                                          .id
                                          .toString(),
                                      index: index,
                                    );
                                  },
                                  backgroundColor: AppColors.secondray,
                                  foregroundColor: AppColors.primary,
                                  icon: Icons.done,
                                  label: 'حذف',
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                if (AppCubit.get(context)
                                        .notificationModel[index]
                                        .orderStatus ==
                                    "chat") {
                                  AppRouter.navigateTo(
                                      context, const ChatView());
                                } else if (AppCubit.get(context)
                                        .notificationModel[index]
                                        .orderStatus ==
                                    "finish") {
                                  AppCubit.get(context)
                                      .changeScreenIndex(index: 1);
                                }
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                padding: EdgeInsets.all(10.sp),
                                width: 343.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.field),
                                child: Padding(
                                  padding: EdgeInsets.all(0.sp),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 36.w,
                                        width: 36.w,
                                        margin: EdgeInsetsDirectional.only(
                                            end: 10.w),
                                        decoration: BoxDecoration(
                                          color: AppCubit.get(context)
                                                      .notificationModel[index]
                                                      .orderStatus ==
                                                  "finish"
                                              ? AppColors.darkGreen
                                              : AppCubit.get(context)
                                                          .notificationModel[
                                                              index]
                                                          .orderStatus ==
                                                      "chat"
                                                  ? Colors.blue
                                                  : Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            AppCubit.get(context)
                                                        .notificationModel[
                                                            index]
                                                        .orderStatus ==
                                                    "finish"
                                                ? Icons
                                                    .check_circle_outline_outlined
                                                : AppCubit.get(context)
                                                            .notificationModel[
                                                                index]
                                                            .orderStatus ==
                                                        "chat"
                                                    ? CupertinoIcons
                                                        .chat_bubble_2
                                                    : Icons.event_available,
                                            color: Colors.white,
                                            size: 28.sp,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 7.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            text: AppCubit.get(context)
                                                .notificationModel[index]
                                                .orderStatus,
                                            size: 14.sp,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 190.w,
                                            child: AppText(
                                              text: AppCubit.get(context)
                                                  .notificationModel[index]
                                                  .message,
                                              lines: 2,
                                              color: Colors.grey,
                                              size: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 14.sp,
                                            color: Colors.grey,
                                          ),
                                          AppText(
                                            text: AppCubit.get(context)
                                                .notificationModel[index]
                                                .duration,
                                            size: 12.sp,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
        );
      },
    );
  }
}
