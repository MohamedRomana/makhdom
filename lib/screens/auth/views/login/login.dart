import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import 'package:makhdom/screens/auth/views/user_register/user_register.dart';
import 'package:makhdom/screens/client_screens/home_layout/home/home.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/flash_message.dart';
import '../../../../gen/fonts.gen.dart';
import '../../data/auth_cubit.dart';
import '../forget_pass/forget_pass.dart';
import '../widgets/auth_header.dart';
import 'widgets/login_fields.dart';

final _formKey = GlobalKey<FormState>();
final _phoneController = TextEditingController();
final _passController = TextEditingController();
String phoneCode = "";

class LogIn extends StatelessWidget {
  final String type;
  const LogIn({super.key, required this.type});

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
                text: LocaleKeys.login.tr(),
                top: 36.h,
                left: 220.w,
                right: 24.w,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              CustomLoginFields(
                formKey: _formKey,
                phoneController: _phoneController,
                passController: _passController,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LogInSuccess) {
                    // AppCubit.get(context).changebottomNavIndex(2);
                    // AppRouter.navigateAndFinish(
                    //     context,
                    //     CacheHelper.getUserType() == "client"
                    //         ? const HomeLayOut()
                    //         : const ProviderOrders());
                    AppRouter.navigateAndPop(context, const Home());
                    _phoneController.clear();
                    _passController.clear();
                    showFlashMessage(
                      context: context,
                      type: FlashMessageType.success,
                      message: LocaleKeys.welcomeToMaosul.tr(),
                    );
                  } else if (state is LogInFailure) {
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
                        await AuthCubit.get(context).logIn(
                          phone: _phoneController.text,
                          password: _passController.text,
                        );
                      }
                    },
                    child: state is LogInLoading
                        ? const CircularProgressIndicator(
                            color: AppColors.secondray)
                        : AppText(
                            text: LocaleKeys.signin.tr(),
                            color: AppColors.secondray,
                            family: FontFamily.dINArabicBold,
                          ),
                  );
                },
              ),
              TextButton(
                onPressed: () =>
                    AppRouter.navigateTo(context, const ForgetPass()),
                child: AppText(
                  text: LocaleKeys.forgetPass.tr(),
                  size: 14.sp,
                  color: AppColors.newsText,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: LocaleKeys.no_account.tr(),
                    size: 18.sp,
                    family: FontFamily.dINArabicBold,
                    color: AppColors.boldText,
                  ),
                  InkWell(
                    onTap: () {
                      AppRouter.navigateTo(
                        context,
                        UserRegister(type: type),
                      );
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: AppText(
                      text: LocaleKeys.newUser.tr(),
                      size: 18.sp,
                      start: 5.w,
                      family: FontFamily.dINArabicBold,
                      color: AppColors.newsText,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
