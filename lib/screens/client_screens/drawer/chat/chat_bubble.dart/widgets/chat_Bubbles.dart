import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makhdom/core/cache/cache_helper.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/service/models/room_chat_model.dart';
import '../../../../../../core/widgets/app_text.dart';

class ChatBubbles extends StatelessWidget {
  final int index;
  final RoomChatModel roomChat;
  const ChatBubbles({
    super.key,
    required this.index,
    required this.roomChat,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: roomChat.fromId != int.parse(CacheHelper.getUserId())
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (roomChat.fromId == int.parse(CacheHelper.getUserId()))
          Container(
            padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 13.w),
            height: 50.h,
            width: 50.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: SvgPicture.asset(
              'assets/svg/person.svg',
              height: 27.h,
              width: 24.w,
            ),
          ),
        Flexible(
          child: Container(
            height: 50.h,
            width: 252.w,
            margin: EdgeInsetsDirectional.only(
              start: 10.w,
              end: 10.w,
              top: 15.h,
            ),
            decoration: BoxDecoration(
              color: roomChat.fromId == int.parse(CacheHelper.getUserId())
                  ? AppColors.chatColor
                  : const Color(0xffD9D9D9),
              borderRadius:
                  roomChat.fromId == int.parse(CacheHelper.getUserId())
                      ? BorderRadiusDirectional.only(
                          topEnd: Radius.circular(25.r),
                          bottomEnd: Radius.circular(25.r),
                          bottomStart: Radius.circular(25.r),
                        )
                      : BorderRadiusDirectional.only(
                          topStart: Radius.circular(25.r),
                          bottomEnd: Radius.circular(25.r),
                          bottomStart: Radius.circular(25.r),
                        ),
            ),
            child: Center(
              child: AppText(
                text: roomChat.message,
                color: roomChat.fromId != int.parse(CacheHelper.getUserId())
                    ? const Color(0xff505050)
                    : Colors.white,
                size: 15.sp,
                family: 'DINArabic-Medium',
              ),
            ),
          ),
        ),
        if (roomChat.fromId != int.parse(CacheHelper.getUserId()))
          Container(
            padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 13.w),
            height: 50.h,
            width: 50.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: SvgPicture.asset(
              'assets/svg/person.svg',
              height: 27.h,
              width: 24.w,
            ),
          ),
      ],
    );
  }
}
