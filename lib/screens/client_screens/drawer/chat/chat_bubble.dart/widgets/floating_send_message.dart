import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/widgets/app_input.dart';
import '../../../../../../generated/locale_keys.g.dart';

final _sendMessage = TextEditingController();

class FloatingSendMessageContainer extends StatelessWidget {
  const FloatingSendMessageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          height: 56.h,
          width: 333.w,
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(21.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 5.r,
                spreadRadius: 1.r,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Center(
            child: AppInput(
              filled: true,
              color: Colors.white,
              end: 5.w,
              borderColorr: Colors.transparent,
              focusedBorderColor: Colors.transparent,
              hint: LocaleKeys.yourMessage.tr(),
              textInputAction: TextInputAction.send,
              controller: _sendMessage,
              onSubmitted: (value) {
                AppCubit.get(context).sendMessage(message: _sendMessage.text);
                _sendMessage.clear();
                FocusScope.of(context).unfocus();
              },
              suffixIcon: state is SendMessageLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.chatColor,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        AppCubit.get(context)
                            .sendMessage(message: _sendMessage.text);
                        _sendMessage.clear();
                        FocusScope.of(context).unfocus();
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Icon(
                        Icons.send,
                        color: AppColors.chatColor,
                        size: 25.sp,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
