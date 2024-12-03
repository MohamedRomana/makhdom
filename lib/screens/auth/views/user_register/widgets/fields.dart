import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/app_input.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/auth_cubit.dart';

class CustomUserRegisterFields extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController cityController;
  final TextEditingController passController;
  final TextEditingController confirmPassController;

  const CustomUserRegisterFields({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.cityController,
    required this.passController,
    required this.confirmPassController,
  });

  @override
  State<CustomUserRegisterFields> createState() =>
      _CustomUserRegisterFieldsState();
}

class _CustomUserRegisterFieldsState extends State<CustomUserRegisterFields> {
  @override
  Widget build(BuildContext context) {
    List<String> city = ['test1', 'test2', 'test3'];
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: LocaleKeys.name.tr(), start: 24.w, bottom: 10.h),
          AppInput(
            bottom: 16.h,
            filled: true,
            hint: LocaleKeys.username.tr(),
            controller: widget.nameController,
            inputType: TextInputType.phone,
            validate: (value) {
              if (value!.isEmpty) {
                return LocaleKeys.usernameValidate.tr();
              } else {
                return null;
              }
            },
          ),
          AppText(text: LocaleKeys.phone.tr(), start: 24.w, bottom: 10.h),
          AppInput(
            bottom: 16.h,
            filled: true,
            hint: LocaleKeys.phone.tr(),
            controller: widget.phoneController,
            inputType: TextInputType.phone,
            validate: (value) {
              if (value!.isEmpty) {
                return LocaleKeys.phoneValidate.tr();
              } else {
                return null;
              }
            },
          ),
          AppText(text: LocaleKeys.city.tr(), start: 24.w, bottom: 10.h),
          AppInput(
            filled: true,
            bottom: 16.h,
            controller: widget.cityController,
            validate: (value) {
              if (value!.isEmpty) {
                return LocaleKeys.cityValidate.tr();
              } else {
                return null;
              }
            },
            hint: LocaleKeys.selectCity.tr(),
            suffixIcon: Padding(
              padding:  EdgeInsetsDirectional.only(end: 16.w),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: city.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      widget.cityController.text = value!;
                    });
                  },
                ),
              ),
            ),
          ),
          AppText(text: LocaleKeys.password.tr(), start: 24.w, bottom: 10.h),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return AppInput(
                filled: true,
                bottom: 16.h,
                hint: LocaleKeys.password.tr(),
                controller: widget.passController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return LocaleKeys.passwordValidate.tr();
                  } else {
                    return null;
                  }
                },
                secureText: AuthCubit.get(context).isSecureRegister1,
                suffixIcon: AuthCubit.get(context).isSecureRegister1
                    ? InkWell(
                        onTap: () {
                          AuthCubit.get(context).isSecureRegisterIcon1(false);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.all(8.h),
                          child: Icon(
                            Icons.visibility_off,
                            color: AppColors.primary,
                            size: 21.sp,
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          AuthCubit.get(context).isSecureRegisterIcon1(true);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.all(8.h),
                          child: Icon(
                            Icons.visibility,
                            color: AppColors.primary,
                            size: 21.sp,
                          ),
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
