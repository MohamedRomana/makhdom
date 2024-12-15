import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/service/cubit/app_cubit.dart';
import '../../../../core/widgets/app_text.dart';

class CustomDate extends StatefulWidget {
  const CustomDate({
    super.key,
  });

  @override
  State<CustomDate> createState() => _CustomDateState();
}

class _CustomDateState extends State<CustomDate> {
  @override
  void initState() {
    AppCubit.get(context).chooseDateIndexFun(0);
    AppCubit.get(context).chooseTimeIndexFun(-1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppCubit.get(context).dateList.isEmpty
        ? const SizedBox.shrink()
        : BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: LocaleKeys.available_appointments.tr(),
                    size: 18.sp,
                    color: AppColors.text,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 8.w),
                  SizedBox(
                    height: 70.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 8.w),
                      itemCount: AppCubit.get(context).dateList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          AppCubit.get(context).chooseDateIndexFun(index);
                          AppCubit.get(context).chooseTimeIndexFun(-1);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: 55.w,
                          decoration: BoxDecoration(
                              color:
                                  AppCubit.get(context).chooseDateIndex == index
                                      ? AppColors.primary
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: Colors.grey),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary,
                                  blurRadius: 5.r,
                                  spreadRadius: -1.r,
                                  offset: Offset(0, 5.r),
                                )
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                text: AppCubit.get(context).dateList[index]
                                        ['day_f_short'] ??
                                    "",
                                size: 13.sp,
                                color: AppCubit.get(context).chooseDateIndex ==
                                        index
                                    ? Colors.white
                                    : AppColors.text,
                              ),
                              AppText(
                                text: AppCubit.get(context).dateList[index]
                                    ['day'],
                                size: 19.sp,
                                fontWeight: FontWeight.w700,
                                color: AppCubit.get(context).chooseDateIndex ==
                                        index
                                    ? Colors.white
                                    : AppColors.text,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
  }
}
