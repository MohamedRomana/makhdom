import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';

class ServicesProvided extends StatelessWidget {
  const ServicesProvided({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: AppText(
              text: 'الخدمات المقدمة',
              size: 15.sp,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          width: 343.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.field,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: Colors.grey),
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: const Divider(thickness: 1, color: AppColors.secondray)),
            itemCount: AppCubit.get(context).provider['services'].length,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: AppCubit.get(context).provider['services'][index]
                          ['title'] ??
                      "",
                  size: 15.sp,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: const Color(0xffFED517),
                      size: 20.sp,
                    ),
                    SizedBox(width: 3.h),
                    AppText(
                      text: AppCubit.get(context)
                          .provider['services'][index]['rate']
                          .toString(),
                      color: Colors.grey,
                      size: 15.sp,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
