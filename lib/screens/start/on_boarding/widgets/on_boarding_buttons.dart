import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/generated/locale_keys.g.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_router.dart';
import '../../../../core/widgets/app_text.dart';
import '../../type/type.dart';

class CustomOnBoardingButtons extends StatelessWidget {
  const CustomOnBoardingButtons({
    super.key,
    required this.onBoardingList,
    required this.currPage,
    required this.pageController,
  });

  final List onBoardingList;
  final double currPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.h,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 46.h),
            child: Row(
              children: [
                Container(
                  height: 187.h,
                  width: 122.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/clip.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      currPage >= onBoardingList.length - 1.5
                          ? AppRouter.navigateAndPop(
                              context, const TypeScreen())
                          : pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: const Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 116.w),
                Column(
                  children: [
                    DotsIndicator(
                      dotsCount: onBoardingList.length,
                      position: currPage,
                      decorator: DotsDecorator(
                        activeColor: AppColors.primary,
                        color: const Color(0xffB3B3B3),
                        size: Size.square(15.r),
                        activeSize: Size(15.w, 15.h),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 30.w),
                      child: currPage >= onBoardingList.length - 1.5
                          ? SizedBox(
                              height: 60.h,
                              width: 60.w,
                            )
                          : InkWell(
                              onTap: () {
                                pageController.animateToPage(
                                  onBoardingList.length - 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: SizedBox(
                                height: 60.w,
                                width: 60.w,
                                child: Center(
                                  child: AppText(
                                      text: LocaleKeys.skip.tr(), size: 16.sp),
                                ),
                              ),
                            ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
