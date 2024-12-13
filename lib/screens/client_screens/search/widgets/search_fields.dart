import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_input.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../generated/locale_keys.g.dart';

class SearchFields extends StatelessWidget {
  final TextEditingController serviceNameController;
  final TextEditingController serviceTypeController;
  final TextEditingController cityController;
  final TextEditingController rateController;

  const SearchFields({
    super.key,
    required this.serviceNameController,
    required this.serviceTypeController,
    required this.cityController,
    required this.rateController,
  });

  @override
  Widget build(BuildContext context) {
    List<String> rating = [
      LocaleKeys.sort_by_lowest_price.tr(),
      LocaleKeys.sort_by_highest_rating.tr(),
    ];
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: LocaleKeys.service_name.tr(), size: 14.sp, bottom: 10.h),
          AppInput(
            bottom: 16.h,
            filled: true,
            start: 0,
            end: 0,
            controller: serviceNameController,
            inputType: TextInputType.name,
            hint: 'ادخل اسم الخدمه',
            enabledBorderColor: AppColors.borderColor,
            contentRight: 20.w,
          ),
          AppText(text: 'نوع الخدمه', size: 14.sp, bottom: 10.h),
          AppInput(
            bottom: 16.h,
            filled: true,
            start: 0,
            end: 0,
            read: true,
            controller: serviceTypeController,
            inputType: TextInputType.name,
            hint: 'اختر نوع الخدمه',
            contentRight: 20.w,
            enabledBorderColor: AppColors.borderColor,
            suffixIcon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
              size: 25.sp,
            ),
            onTap: () async {
              String? value = await showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    backgroundColor: AppColors.borderColor,
                    title: AppText(
                      text: 'اختر نوع الخدمه',
                      size: 21.sp,
                      family: FontFamily.dINArabicBold,
                    ),
                    children: AppCubit.get(context).sectionsModel.map(
                      (value) {
                        return SimpleDialogOption(
                          onPressed: () {
                            AppCubit.get(context).sectionId = value.id.toString();
                            Navigator.pop(context, value.title);
                          },
                          child: AppText(
                            text: value.title,
                            size: 18.sp,
                            family: FontFamily.dINArabicBold,
                            color: AppColors.primary,
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
              );
              if (value != null) {
                serviceTypeController.text = value;
              }
            },
          ),
          AppText(text: LocaleKeys.city.tr(), size: 14.sp, bottom: 10.h),
          AppInput(
            bottom: 16.h,
            filled: true,
            start: 0,
            end: 0,
            read: true,
            controller: cityController,
            inputType: TextInputType.name,
            hint: 'اختر مدينه',
            contentRight: 20.w,
            enabledBorderColor: AppColors.borderColor,
            suffixIcon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
              size: 25.sp,
            ),
            onTap: () async {
              String? value = await showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    backgroundColor: AppColors.borderColor,
                    title: AppText(
                      text: 'اختر مدينه',
                      size: 21.sp,
                      family: FontFamily.dINArabicBold,
                    ),
                    children: AppCubit.get(context).citiesList.map(
                      (value) {
                        return SimpleDialogOption(
                          onPressed: () {
                            AppCubit.get(context).cityId = value.id.toString();
                            Navigator.pop(context, value.title);
                          },
                          child: AppText(
                            text: value.title,
                            size: 18.sp,
                            family: FontFamily.dINArabicBold,
                            color: AppColors.primary,
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
              );
              if (value != null) {
                cityController.text = value;
              }
            },
          ),
          AppText(text: 'تقييم الخدمه', size: 14.sp, bottom: 10.h),
          AppInput(
            bottom: 32.h,
            filled: true,
            start: 0,
            end: 0,
            read: true,
            controller: rateController,
            inputType: TextInputType.name,
            hint: LocaleKeys.sort_by_highest_rating.tr(),
            contentRight: 20.w,
            enabledBorderColor: AppColors.borderColor,
            suffixIcon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
              size: 25.sp,
            ),
            onTap: () async {
              String? value = await showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    backgroundColor: AppColors.borderColor,
                    title: AppText(
                      text: 'تقييم الخدمه',
                      size: 21.sp,
                      family: FontFamily.dINArabicBold,
                    ),
                    children: rating.map(
                      (String value) {
                        return SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, value);
                          },
                          child: AppText(
                            text: value,
                            size: 18.sp,
                            family: FontFamily.dINArabicBold,
                            color: AppColors.primary,
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
              );
              if (value != null) {
                rateController.text = value;
              }
            },
          ),
        ],
      ),
    );
  }
}
