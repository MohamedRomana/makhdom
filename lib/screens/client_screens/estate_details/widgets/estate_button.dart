import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import 'package:makhdom/screens/client_screens/drawer/chat/chat_bubble.dart/chat_details.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/contsants.dart';
import '../../../../core/widgets/app_router.dart';
import '../../../../core/widgets/app_text.dart';

class EstateButton extends StatelessWidget {
  const EstateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            makePhoneCall("+201555625858");
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 50.h,
            width: 160.w,
            decoration: BoxDecoration(
              color: AppColors.secondray,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.phone_outlined,
                  color: AppColors.primary,
                  size: 20.sp,
                ),
                AppText(
                  text: LocaleKeys.contact.tr(),
                  size: 17.sp,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 50.h,
            width: 160.w,
            decoration: BoxDecoration(
              color: AppColors.secondray,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: InkWell(
              onTap: () {
                AppRouter.navigateTo(
                  context,
                  ChatDetails(
                    name: AppCubit.get(context).showEstateList['saler_name'] ??
                        "",
                    id: AppCubit.get(context)
                        .showEstateList['saler_id']
                        .toString(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.chat_outlined,
                    color: AppColors.primary,
                    size: 20.sp,
                  ),
                  AppText(
                    text: LocaleKeys.chat.tr(),
                    size: 17.sp,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
