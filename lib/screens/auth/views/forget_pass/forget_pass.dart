import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_input.dart';
import '../../../../core/widgets/flash_message.dart';
import '../../../../gen/fonts.gen.dart';
import '../../data/auth_cubit.dart';
import '../reset_pass/reset_pass.dart';
import '../widgets/auth_header.dart';

final _formKey = GlobalKey<FormState>();
final _phoneController = TextEditingController();
String forgetPassPhoneCode = "";

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomAuthHeader(
                  text: LocaleKeys.forgetPass.tr(),
                  bottom: 18.h,
                  top: 36.h,
                  left: 180.w,
                  right: 24.w,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                AppInput(
                  top: 27.h,
                  bottom: 24.h,
                  filled: true,
                  contentRight: 20.w,
                  hint: LocaleKeys.phone.tr(),
                  controller: _phoneController,
                  inputType: TextInputType.phone,
                  prefixIcon: SvgPicture.asset('assets/svg/phone.svg'),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return LocaleKeys.phoneValidate.tr();
                    } else {
                      return null;
                    }
                  },
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is ForgetPassFailure) {
                      showFlashMessage(
                        context: context,
                        type: FlashMessageType.error,
                        message: state.error,
                      );
                    } else if (state is ForgetPassSuccess) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPass()));
                      _phoneController.clear();
                      showFlashMessage(
                        context: context,
                        type: FlashMessageType.success,
                        message: state.message,
                      );
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                      bottom: 29.h,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          AuthCubit.get(context).forgetPass(
                            phone: _phoneController.text,
                          );
                        }
                      },
                      child: state is ForgetPassLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : AppText(
                              text: LocaleKeys.confirm.tr(),
                              color: AppColors.secondray,
                              family: FontFamily.dINArabicBold,
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
