import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: AppText(
            text: 'الخدمات المقدمة',
            size: 15.sp,
            color: Colors.black,
          ),
        ),
        Container(
          height: 160.h,
          width: 343.w,
          decoration: BoxDecoration(
            color: AppColors.field,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'اسم الخدمة',
                      size: 15.sp,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffFED517),
                        ),
                        SizedBox(width: 3.h),
                        AppText(
                          text: '+3',
                          color: Colors.grey,
                          size: 15.sp,
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: AppColors.secondray,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'اسم الخدمة',
                      size: 15.sp,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xffFED517),
                            ),
                            SizedBox(width: 3.h),
                            AppText(
                              text: '+3',
                              color: Colors.grey,
                              size: 15.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: AppColors.secondray,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'اسم الخدمة',
                      size: 15.sp,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffFED517),
                        ),
                        SizedBox(width: 3.h),
                        AppText(
                          text: '+3',
                          color: Colors.grey,
                          size: 15.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
