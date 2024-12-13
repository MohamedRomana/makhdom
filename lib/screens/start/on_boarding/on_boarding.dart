import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/constants/colors.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/gen/fonts.gen.dart';
import '../../../core/widgets/app_cached.dart';
import 'widgets/on_boarding_buttons.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  double currPage = 0.0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {
          currPage = pageController.page!;
        });
      });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: AppCubit.get(context).introList.isNotEmpty
              ? Stack(
                  children: [
                    PageView.builder(
                      controller: pageController,
                      itemCount: AppCubit.get(context).introList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(height: 50.h),
                            AppCachedImage(
                              image: AppCubit.get(context).introList[index]
                                  ["image"],
                              height: 400.h,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 311.w,
                              child: AppText(
                                text: AppCubit.get(context).introList[index]
                                    ["title"],
                                size: 24.sp,
                                family: FontFamily.dINArabicBold,
                                color: AppColors.boldText,
                                lines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 311.w,
                              child: AppText(
                                top: 16.h,
                                text: AppCubit.get(context).introList[index]
                                    ["desc"],
                                size: 14.sp,
                                lines: 5,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    CustomOnBoardingButtons(
                      onBoardingList: AppCubit.get(context).introList,
                      currPage: currPage,
                      pageController: pageController,
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
        );
      },
    );
  }
}
