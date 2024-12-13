import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_button.dart';
import 'package:makhdom/core/widgets/app_input.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/core/widgets/flash_message.dart';
import 'package:makhdom/screens/client_screens/home_layout/home_layout.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_bottom_nav.dart';
import '../../../../generated/locale_keys.g.dart';
import '../custom_drawer.dart';

final _formKey = GlobalKey<FormState>();
final _nameController = TextEditingController();
final _phoneController = TextEditingController();
final _messageController = TextEditingController();

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Scaffold(
            key: scaffoldKey,
            drawer: CustomDrawer(langContext: context),
            bottomNavigationBar: const CustomBottomNav(),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.h),
              child: CustomAppBar(
                scaffoldKey: scaffoldKey,
                title: LocaleKeys.contactUs.tr(),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 45.h),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: AppText(
                        text: LocaleKeys.name.tr(),
                        color: AppColors.text,
                        bottom: 10.h,
                      ),
                    ),
                    AppInput(
                      filled: true,
                      color: AppColors.field,
                      enabledBorderColor: Colors.grey,
                      focusedBorderColor: Colors.grey,
                      hint: LocaleKeys.enter_user_name.tr(),
                      start: 0,
                      end: 0,
                      controller: _nameController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.enter_user_name.tr();
                        } else {
                          return null;
                        }
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: AppText(
                        text: LocaleKeys.phone.tr(),
                        color: AppColors.text,
                        bottom: 10.h,
                        top: 15.h,
                      ),
                    ),
                    AppInput(
                      filled: true,
                      color: AppColors.field,
                      enabledBorderColor: Colors.grey,
                      focusedBorderColor: Colors.grey,
                      hint: LocaleKeys.phone.tr(),
                      start: 0,
                      end: 0,
                      controller: _phoneController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.phoneValidate.tr();
                        } else {
                          return null;
                        }
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: AppText(
                        text: LocaleKeys.yourMessage.tr(),
                        color: AppColors.text,
                        bottom: 10.h,
                        top: 15.h,
                      ),
                    ),
                    AppInput(
                        filled: true,
                        color: AppColors.field,
                        enabledBorderColor: Colors.grey,
                        focusedBorderColor: Colors.grey,
                        hint: LocaleKeys.yourMessage.tr(),
                        maxLines: 5,
                        start: 0,
                        end: 0,
                        controller: _messageController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.yourMessage.tr();
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(height: 32.h),
                    BlocConsumer<AppCubit, AppState>(
                      listener: (context, state) {
                        if (state is ContactUsSuccess) {
                          AppCubit.get(context).changeScreenIndex(index: 0);
                          AppRouter.navigateAndFinish(
                              context, const HomeLayout());
                          _nameController.clear();
                          _phoneController.clear();
                          _messageController.clear();
                          showFlashMessage(
                            message: state.message,
                            type: FlashMessageType.success,
                            context: context,
                          );
                        } else if (state is ContactUsFailure) {
                          showFlashMessage(
                            message: state.error,
                            type: FlashMessageType.error,
                            context: context,
                          );
                        }
                      },
                      builder: (context, state) {
                        return AppButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await AppCubit.get(context).contactUs(
                                name: _nameController.text,
                                phone: _phoneController.text,
                                message: _messageController.text,
                              );
                            }
                          },
                          width: 343.w,
                          child: state is ContactUsLoading
                              ? const CircularProgressIndicator(
                                  color: AppColors.secondray,
                                )
                              : AppText(
                                  text: LocaleKeys.send.tr(),
                                  color: AppColors.secondray,
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
      },
    );
  }
}
