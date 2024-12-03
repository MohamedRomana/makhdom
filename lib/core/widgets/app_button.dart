import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/constants/colors.dart';

class AppButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget? iconComponent;
  final Widget? textComponent;
  final Color? color;
  final double? height;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  final double? radius;
  final double? width;
  final List<Color>? colors;
  final Widget child;
  final Color? borderColor;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.color,
    this.height,
    this.radius,
    this.width,
    this.top,
    this.bottom,
    this.start,
    this.end,
    this.iconComponent,
    this.textComponent,
    this.colors,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: top ?? 0,
        start: start ?? 0,
        bottom: bottom ?? 0,
        end: end ?? 0,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          padding: const WidgetStatePropertyAll(EdgeInsets.all(0)),
          maximumSize: WidgetStateProperty.all(
            Size(width ?? 311.w, height ?? 48.h),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: color ?? AppColors.primary,
            // gradient: LinearGradient(
            //   colors: colors ??
            //       [
            //         const Color(0xff0F2B50),
            //         const Color(0xff0C69E5),
            //       ],
            // ),
            borderRadius: BorderRadius.circular(radius ?? 12.r),
            border:
                Border.all(color: borderColor ?? color ?? AppColors.primary),
          ),
          child: Container(
            constraints: BoxConstraints(
              minWidth: width ?? 327.w,
              minHeight: height ?? 50.h,
            ),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}