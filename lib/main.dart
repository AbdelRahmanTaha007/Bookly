// import 'package:bookly/views/home_view/home_view.dart';
import 'dart:async';

import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manager/newset%20books/newset_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:bookly/features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Timer(const Duration(seconds: 1), () {
    FlutterNativeSplash.remove();
  });
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks() /**ba3d ma t3mel el nos5a nafez el Code da   */,
        ),
        BlocProvider(
            create: (context) => NewsetBooksCubit(
                  getIt.get<HomeRepoImpl>(),
                )..fetchNewsetBooks()),
        BlocProvider(
            create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()))
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
