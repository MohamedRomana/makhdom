import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_cached.dart';
import 'package:makhdom/core/widgets/custom_app_bar.dart';
import 'package:makhdom/core/widgets/flash_message.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import 'package:makhdom/screens/client_screens/drawer/custom_drawer.dart';
import 'package:makhdom/screens/client_screens/edit_profile.dart/widgets/edit_profile_fields.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_router.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_bottom_nav.dart';

final _nameController = TextEditingController();
final _phoneController = TextEditingController();
final _cityController = TextEditingController();

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          drawer: CustomDrawer(langContext: context),
          bottomNavigationBar: const CustomBottomNav(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: CustomAppBar(
              scaffoldKey: scaffoldKey,
              title: LocaleKeys.edit_profile.tr(),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
              child: Column(
                children: [
                  AppCubit.get(context).profileImage.isEmpty
                      ? InkWell(
                          onTap: () => AppCubit.get(context).getProfileImage(),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: AppCachedImage(
                                  image: AppCubit.get(context)
                                          .showUserAccount["avatar"] ??
                                      "",
                                  height: 120.h,
                                  width: 120.w,
                                ),
                              ),
                              PositionedDirectional(
                                end: 0,
                                child: Icon(
                                  Icons.edit_square,
                                  color: AppColors.primary,
                                  size: 25.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Stack(
                          children: [
                            Container(
                              height: 120.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: FileImage(
                                      AppCubit.get(context).profileImage.first),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            PositionedDirectional(
                              child: InkWell(
                                onTap: () =>
                                    AppCubit.get(context).removeProfileImage(),
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Icon(
                                  CupertinoIcons.xmark_circle_fill,
                                  color: Colors.red,
                                  size: 25.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                  SizedBox(height: 30.h),
                  Column(
                    children: [
                      EditProfileFields(
                        nameController: _nameController,
                        phoneController: _phoneController,
                        cityController: _cityController,
                        citiesList: AppCubit.get(context).citiesList,
                      ),
                    ],
                  ),
                  BlocConsumer<AppCubit, AppState>(
                    listener: (context, state) {
                      if (state is UpdateProfileSuccess) {
                        AppRouter.pop(context);

                        showFlashMessage(
                          message: state.message,
                          type: FlashMessageType.success,
                          context: context,
                        );
                        _nameController.clear();
                        _phoneController.clear();
                        _cityController.clear();
                      } else if (state is UpdateProfileFailure) {
                        showFlashMessage(
                          message: state.error,
                          type: FlashMessageType.error,
                          context: context,
                        );
                      }
                    },
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 25.h),
                        child: AppButton(
                          onPressed: () {
                            AppCubit.get(context).updateProfile(
                              firstName: _nameController.text.isEmpty
                                  ? AppCubit.get(context)
                                      .showUserAccount["first_name"]
                                  : _nameController.text,
                              phone: _phoneController.text.isEmpty
                                  ? AppCubit.get(context)
                                      .showUserAccount['phone']
                                  : _phoneController.text,
                            );
                          },
                          width: 343.w,
                          color: AppColors.primary,
                          child: state is UpdateProfileLoading ||
                                  state is UploadImagesLoading
                              ? const CircularProgressIndicator(
                                  color: AppColors.secondray,
                                )
                              : AppText(
                                  text: LocaleKeys.save.tr(),
                                  color: AppColors.secondray,
                                ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
