import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cache/cache_helper.dart';
import 'core/location/location_helper.dart';
import 'core/service/bloc_observer.dart';
import 'core/service/cubit/app_cubit.dart';
import 'gen/fonts.gen.dart';
import 'generated/codegen_loader.g.dart';
import 'screens/auth/data/auth_cubit.dart';
import 'screens/start/splash/splash.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await NotificationHelper.init();
  await EasyLocalization.ensureInitialized();
  LocationHelper.determinePosition();
  debugPrint("token is ${CacheHelper.getUserToken()}");
  debugPrint("userId is ${CacheHelper.getUserId()}");
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      saveLocale: true,
      useOnlyLangCode: true,
      startLocale:
          Locale(CacheHelper.getLang() == "" ? "ar" : CacheHelper.getLang()),
      assetLoader: const CodegenLoader(),
      path: 'assets/Lang',
      fallbackLocale:
          Locale(CacheHelper.getLang() == "" ? "ar" : CacheHelper.getLang()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   NotificationHelper.onInit();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AppCubit()..getSections()),
            BlocProvider(create: (context) => AuthCubit()),
          ],
          child: MaterialApp(
            theme: ThemeData(
              fontFamily: FontFamily.dINArabicMedium,
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            builder: (context, child) => child!,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: child,
          ),
        );
      },
      child: const Splash(),
    );
  }
}
