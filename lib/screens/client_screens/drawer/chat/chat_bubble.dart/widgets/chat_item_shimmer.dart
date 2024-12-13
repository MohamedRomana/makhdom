// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_shimmer.dart';

class ChatItemShimmer extends StatelessWidget {
  const ChatItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: ListView.separated(
        reverse: true,
        padding: EdgeInsets.only(
          right: 16.w,
          left: 16.w,
          bottom: 80.h,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: 7,
        separatorBuilder: (context, index) => SizedBox(height: 5.h),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: index % 2 != 0
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (index % 2 == 0)
                Container(
                  height: 50.w,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svg/person.svg',
                      color: Colors.grey.withOpacity(.1),
                      width: 34.w,
                    ),
                  ),
                ),
              Flexible(
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                    end: 10.w,
                    start: 10.w,
                    top: 15.h,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: index % 2 != 0
                        ? BorderRadiusDirectional.only(
                            topEnd: Radius.circular(25.r),
                            topStart: Radius.circular(25.r),
                            bottomStart: Radius.circular(25.r),
                          )
                        : BorderRadiusDirectional.only(
                            topEnd: Radius.circular(25.r),
                            topStart: Radius.circular(25.r),
                            bottomEnd: Radius.circular(25.r),
                          ),
                  ),
                  child: AppText(
                    text: "هلا ومرحبا",
                    size: 14.sp,
                    color: Colors.grey.withOpacity(.1),
                  ),
                ),
              ),
              if (index % 2 != 0)
                Container(
                  height: 50.w,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svg/person.svg',
                      color: Colors.grey.withOpacity(.1),
                      width: 34.w,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
