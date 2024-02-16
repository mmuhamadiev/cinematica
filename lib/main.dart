import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinopoisk_search/domain/repositories/locator.dart';
import 'package:kinopoisk_search/firebase_options.dart';
import 'package:kinopoisk_search/presentation/manager/firebase_bloc/firebase_cubit.dart';
import 'package:kinopoisk_search/presentation/manager/internet_bloc/internet_cubit.dart';
import 'package:kinopoisk_search/presentation/manager/movie_bloc/movie_bloc.dart';
import 'package:kinopoisk_search/presentation/pages/favourite/manager/favourite_cubit.dart';
import 'package:kinopoisk_search/presentation/pages/movie_datails/manager/movie_details_cubit.dart';
import 'package:kinopoisk_search/presentation/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/pages/main/manager/main_cubit.dart';
import 'presentation/pages/splash/manager/splash_cubit.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupConfiguration();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late SplashCubit _splashCubit;
  late InternetCubit _internetCubit;
  late MainCubit _mainCubit;
  late MovieDetailsCubit _movieDetailsCubit;
  late FavouriteCubit _favouriteCubit;
  late MovieBloc _movieBloc;
  late FirebaseCubit _firebaseCubit;

  @override
  void initState() {

    _splashCubit = getIt<SplashCubit>();
    _internetCubit = getIt<InternetCubit>();
    _mainCubit = getIt<MainCubit>();
    _movieDetailsCubit = getIt<MovieDetailsCubit>();
    _favouriteCubit = getIt<FavouriteCubit>();
    _movieBloc = getIt<MovieBloc>();
    _firebaseCubit = getIt<FirebaseCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => _splashCubit,),
          BlocProvider(create: (context) => _internetCubit,),
          BlocProvider(create: (context) => _mainCubit,),
          BlocProvider(create: (context) => _favouriteCubit,),
          BlocProvider(create: (context) => _movieDetailsCubit,),
          BlocProvider(create: (context) => _movieBloc,),
          BlocProvider(create: (context) => _firebaseCubit,),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Cinametica',
          theme: FlexThemeData.light(
            colors: const FlexSchemeColor(
              primary: Color(0xff1a2c42),
              primaryContainer: Color(0xffb1c0dd),
              secondary: Color(0xffe59a18),
              secondaryContainer: Color(0xffe0bd80),
              tertiary: Color(0xfff0b03f),
              tertiaryContainer: Color(0xffe9cfa1),
              appBarColor: Color(0xffe0bd80),
              error: Color(0xffb00020),
            ),
            usedColors: 7,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 7,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 10,
              blendOnColors: false,
              useTextTheme: true,
              useM2StyleDividerInM3: true,
              thinBorderWidth: 0.5,
              defaultRadius: 20.0,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            useMaterial3: true,
            swapLegacyOnMaterial3: true,
            // To use the Playground font, add GoogleFonts package and uncomment
            // fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          darkTheme: FlexThemeData.dark(
            colors: const FlexSchemeColor(
              primary: Color(0xff60748a),
              primaryContainer: Color(0xff1a2c42),
              secondary: Color(0xffebb251),
              secondaryContainer: Color(0xffd48608),
              tertiary: Color(0xfff4ca7e),
              tertiaryContainer: Color(0xffc68e2d),
              appBarColor: Color(0xffd48608),
              error: Color(0xffcf6679),
            ),
            usedColors: 7,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 13,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 20,
              useTextTheme: true,
              useM2StyleDividerInM3: true,
              defaultRadius: 20.0,
              thinBorderWidth: 0.5,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            useMaterial3: true,
            swapLegacyOnMaterial3: true,
            // To use the Playground font, add GoogleFonts package and uncomment
            // fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          themeMode: ThemeMode.dark,
          routerConfig: router,
        ),
      ),
    );
  }
}

