import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/app_input.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/auth_cubit.dart';

class CustomLoginFields extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController passController;
  final GlobalKey<FormState> formKey;

  const CustomLoginFields({
    super.key,
    required this.phoneController,
    required this.passController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppInput(
            bottom: 16.h,
            filled: true,
            contentRight: 20.w,
            hint: LocaleKeys.phone.tr(),
            controller: phoneController,
            inputType: TextInputType.phone,
            validate: (value) {
              if (value!.isEmpty) {
                return LocaleKeys.phoneValidate.tr();
              } else {
                return null;
              }
            },
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return AppInput(
                filled: true,
                contentRight: 20.w,
                hint: LocaleKeys.password.tr(),
                controller: passController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return LocaleKeys.passwordValidate.tr();
                  } else {
                    return null;
                  }
                },
                secureText: AuthCubit.get(context).isSecureLogIn,
                suffixIcon: AuthCubit.get(context).isSecureLogIn
                    ? InkWell(
                        onTap: () {
                          AuthCubit.get(context).isSecureLogInIcon(false);
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
                          AuthCubit.get(context).isSecureLogInIcon(true);
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
