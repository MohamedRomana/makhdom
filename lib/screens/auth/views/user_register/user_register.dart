import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_router.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/flash_message.dart';
import '../../../../gen/fonts.gen.dart';
import '../../data/auth_cubit.dart';
import '../otp/otp.dart';
import '../widgets/auth_header.dart';
import 'widgets/fields.dart';

final _formKey = GlobalKey<FormState>();
final _nameController = TextEditingController();
final _phoneController = TextEditingController();
final _cityController = TextEditingController();
final _passController = TextEditingController();
final _confirmPassController = TextEditingController();
String userRegisterPhoneCode = "";

class UserRegister extends StatelessWidget {
  final String type;
  const UserRegister({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: Column(
            children: [
              CustomAuthHeader(
                text: LocaleKeys.registerNewUser.tr(),
                top: 36.h,
                left: 135.w,
                right: 24.w,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              CustomUserRegisterFields(
                formKey: _formKey,
                nameController: _nameController,
                phoneController: _phoneController,
                cityController: _cityController,
                passController: _passController,
                confirmPassController: _confirmPassController,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is RegisterSuccess) {
                    AppRouter.navigateAndPop(context, const OTPscreen());
                    _nameController.clear();
                    _phoneController.clear();
                    _cityController.clear();
                    _passController.clear();
                    _confirmPassController.clear();

                    showFlashMessage(
                      context: context,
                      type: FlashMessageType.success,
                      message: state.message,
                    );
                  } else if (state is RegisterFailure) {
                    showFlashMessage(
                      context: context,
                      type: FlashMessageType.error,
                      message: state.error,
                    );
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    top: 24.h,
                    bottom: 29.h,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await AuthCubit.get(context).register(
                          userType: "client",
                          firstName: _nameController.text,
                          phone: _phoneController.text,
                          password: _passController.text,
                        );
                      }
                    },
                    child: state is RegisterLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : AppText(
                            text: LocaleKeys.signingUp.tr(),
                            color: AppColors.secondray,
                            family: FontFamily.dINArabicBold,
                          ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: '${LocaleKeys.alreadyHaveAccount.tr()}!',
                    size: 18.sp,
                    family: FontFamily.dINArabicBold,
                    color: AppColors.boldText,
                  ),
                  InkWell(
                    onTap: () {
                      AppRouter.pop(context);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: AppText(
                      text: LocaleKeys.login.tr(),
                      size: 18.sp,
                      start: 5.w,
                      family: FontFamily.dINArabicBold,
                      color: AppColors.newsText,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
