import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/service/cubit/app_cubit.dart';
import '../../../../core/widgets/app_input.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../generated/locale_keys.g.dart';

class EditProfileFields extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController cityController;
  final List citiesList;
  const EditProfileFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.cityController,
    required this.citiesList,
  });

  @override
  State<EditProfileFields> createState() => _EditProfileFieldsState();
}

class _EditProfileFieldsState extends State<EditProfileFields> {
  @override
  void initState() {
    AppCubit.get(context).getSections();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: LocaleKeys.name.tr(),
          size: 14.sp,
          color: AppColors.text,
          start: 24.w,
          bottom: 10.w,
        ),
        AppInput(
          filled: true,
          controller: widget.nameController,
          color: AppColors.field,
          enabledBorderColor: Colors.grey,
          focusedBorderColor: Colors.grey,
          hint: AppCubit.get(context).showUserAccount['first_name'] ?? "",
        ),
        AppText(
          text: LocaleKeys.phone.tr(),
          size: 14.sp,
          color: AppColors.text,
          start: 24.w,
          top: 16.h,
          bottom: 10.h,
        ),
        AppInput(
          filled: true,
          controller: widget.phoneController,
          color: AppColors.field,
          enabledBorderColor: Colors.grey,
          focusedBorderColor: Colors.grey,
          hint: AppCubit.get(context).showUserAccount['phone'] ?? "",
        ),
        AppText(
          text: LocaleKeys.city.tr(),
          size: 14.sp,
          color: AppColors.text,
          start: 24.w,
          top: 16.h,
          bottom: 10.h,
        ),
        AppInput(
          filled: true,
          color: AppColors.field,
          enabledBorderColor: Colors.grey,
          controller: widget.cityController,
          focusedBorderColor: Colors.grey,
          hint: AppCubit.get(context).showUserAccount['city'] ?? "",
          suffixIcon: Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
            size: 25.sp,
          ),
          read: true,
          onTap: () async {
            String? value = await showDialog<String>(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  backgroundColor: AppColors.secondray,
                  title: AppText(
                    text: LocaleKeys.chooseCity.tr(),
                    color: AppColors.primary,
                    size: 21.sp,
                    family: FontFamily.dINArabicBold,
                  ),
                  children: AppCubit.get(context).citiesList.map((value) {
                    return SimpleDialogOption(
                      onPressed: () {
                        AppCubit.get(context).cityId = value.id.toString();
                        Navigator.pop(context, value.title);
                      },
                      child: AppText(
                        text: value.title,
                        color: AppColors.text,
                        size: 18.sp,
                        family: FontFamily.dINArabicBold,
                      ),
                    );
                  }).toList(),
                );
              },
            );
            if (value != null) {
              widget.cityController.text = value;
            }
          },
        ),
      ],
    );
  }
}
