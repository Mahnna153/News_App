import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/bloc_observer.dart';
import 'package:news/shared/network/local/cache_helper.dart';
import 'package:news/shared/network/remote/dio_helper.dart';
import 'package:news/shared/styles/themes.dart';

import 'layout/home_layout.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.initDio();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark');


  runApp(MyApp(
    isDark: isDark,
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  bool? isDark;

  MyApp({required this.isDark,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.light,
      //AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: NewsHomeScreen(), //startWidget
    );
  }
}
