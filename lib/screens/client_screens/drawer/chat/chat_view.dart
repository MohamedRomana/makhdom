import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import '../../../../core/widgets/app_router.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_bottom_nav.dart';
import '../../../../generated/locale_keys.g.dart';
import '../custom_drawer.dart';
import 'chat_bubble.dart/chat_details.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    AppCubit.get(context).getRooms();
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
              title: LocaleKeys.chat.tr(),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: ListView.builder(
                itemCount: AppCubit.get(context).rooms.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => AppRouter.navigateTo(
                      context,
                      ChatDetails(
                        id: AppCubit.get(context).rooms[index].salerId.toString(),
                        name: AppCubit.get(context).rooms[index].salerName,
                      )),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    padding: EdgeInsets.all(16.sp),
                    height: 82.h,
                    decoration: BoxDecoration(
                      color:
                          index.isEven ? const Color(0xffEFEFEF) : Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            image: const DecorationImage(
                              image: AssetImage('assets/img/chatimage.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 13.w),
                        Column(
                          children: [
                            AppText(
                              text:
                                  AppCubit.get(context).rooms[index].senderName,
                              size: 14.sp,
                              family: 'DINArabic-Medium',
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: AppCubit.get(context)
                                  .rooms[index]
                                  .lastMessage,
                              size: 14.sp,
                              family: 'DINArabic-Light',
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
                              text: AppCubit.get(context).rooms[index].duration,
                              size: 14.sp,
                              family: 'DINArabic-Light',
                            ),
                          ],
                        )
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
