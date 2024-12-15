import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/cache/cache_helper.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/gen/assets.gen.dart';
import 'package:makhdom/screens/client_screens/home_layout/home_layout.dart';
import 'package:makhdom/screens/start/on_boarding/on_boarding.dart';
import '../../../core/service/cubit/app_cubit.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    AppCubit.get(context).intro();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1800));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);

    animationController.forward();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        CacheHelper.getLang() != ""
            ? CacheHelper.getUserId() != ""
                ? CacheHelper.getUserType() == "client"
                    ? AppRouter.navigateAndPop(context, const HomeLayout())
                    : AppRouter.navigateAndPop(context, const HomeLayout())
                : AppRouter.navigateAndPop(context, const HomeLayout())
            : AppRouter.navigateAndPop(context, const OnBoarding());
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedBuilder(
            animation: slidingAnimation,
            builder: (BuildContext context, Widget? child) {
              return SlideTransition(
                position: slidingAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 113.w),
                  child: Image.asset(
                    Assets.img.logo.path,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
