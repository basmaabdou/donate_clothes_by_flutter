import 'package:bloc/bloc.dart';
import 'package:donate_clothes_project/screens/layout/home_layout.dart';
import 'package:donate_clothes_project/screens/main/splash_screen.dart';
import 'package:donate_clothes_project/shared/bloc_observed.dart';
import 'package:donate_clothes_project/shared/componant/constants.dart';
import 'package:donate_clothes_project/shared/network/local/cache_helper.dart';
import 'package:donate_clothes_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';

import 'screens/main/on_boarding_screen.dart';
import 'screens/users/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();




  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
