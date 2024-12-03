import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/gen/fonts.gen.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import 'custom_lottie_widget.dart';

customAlertDialog({
  required BuildContext context,
  Color? barrierColor,
  Color? dialogShadowColor,
  Color? titleTextColor,
  Color? dialogBackGroundColor,
  Color? dialogSurfaceTintColor,
  double? alertDialogHeight,
  double? alertDialogWidth,
  double? blurSigmaX,
  double? dialogElevation,
  double? blurSigmaY,
  EdgeInsetsGeometry? blurOutSidePadding,
  Widget? contentTextWidget,
  Widget? customWidget,
  EdgeInsetsGeometry? contentTextPadding,
  EdgeInsetsGeometry? customWidgetPadding,
  AlignmentGeometry? dialogAlignment,
  EdgeInsets? dialogInsetsPadding,
  ShapeBorder? dialogShape,
  bool? contentScroll = false,
  EdgeInsetsGeometry? dialogContentPadding,
}) {
  showGeneralDialog(
      barrierColor: barrierColor ?? Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurSigmaX ?? 5.0,
              sigmaY: blurSigmaY ?? 5.0,
            ),
            child: AlertDialog(
                alignment: dialogAlignment ?? Alignment.center,
                backgroundColor: dialogBackGroundColor ?? Colors.white,
                surfaceTintColor: dialogSurfaceTintColor ?? Colors.transparent,
                shadowColor: dialogShadowColor ?? Colors.transparent,
                elevation: dialogElevation ?? 0,
                insetPadding: dialogInsetsPadding ??
                    const EdgeInsets.symmetric(horizontal: 0),
                contentPadding: dialogContentPadding ??
                    EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                shape: dialogShape ??
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                buttonPadding: EdgeInsets.zero,
                content: Material(
                  elevation: dialogElevation ?? 0,
                  shape: dialogShape ??
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                  color: dialogBackGroundColor ?? Colors.white,
                  surfaceTintColor:
                      dialogSurfaceTintColor ?? Colors.transparent,
                  child: SizedBox(
                    height: alertDialogHeight ?? 265.h,
                    width: alertDialogWidth ?? double.infinity,
                    child: contentScroll!
                        ? Stack(
                            children: [
                              Padding(
                                padding: customWidgetPadding ??
                                    const EdgeInsets.only(top: 20),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  children: [
                                    customWidget ?? const SizedBox(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: contentTextPadding ??
                                    EdgeInsets.only(top: 18.h),
                                child: contentTextWidget ?? const SizedBox(),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: contentTextPadding ??
                                    EdgeInsets.only(top: 18.h),
                                child: contentTextWidget ?? const SizedBox(),
                              ),
                              Padding(
                                padding: customWidgetPadding ??
                                    const EdgeInsets.only(top: 20),
                                child: customWidget ?? const SizedBox(),
                              ),
                            ],
                          ),
                  ),
                )),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

showLoadingDialog({
  required BuildContext context,
  String? text,
  bool isLottie = false,
  String? loadingText,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        titlePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        backgroundColor: isLottie ? Colors.transparent : Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        title: Column(
          children: [
            isLottie
                ? const CustomLottieWidget()
                : Column(
                    children: [
                      const CircularProgressIndicator(
                        strokeWidth: 3,
                        color: AppColors.primary,
                      ),
                      SizedBox(height: 16.h),
                      AppText(
                        text: loadingText ?? LocaleKeys.loading.tr(),
                        color: AppColors.primary,
                        family: FontFamily.dINArabicBold,
                      ),
                      SizedBox(height: 12.h),
                    ],
                  ),
          ],
        ),
      );
    },
  );
}

