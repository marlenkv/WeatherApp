import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weatherapp/cubit/weather_app_cubit.dart';
import 'package:flutter_weatherapp/firstScreen.dart';
import 'package:flutter_weatherapp/models/Weather_Model.dart';

import 'secondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(brightness: Brightness.dark),
          home: child,
        );
      },
      child: FirstScreen(),
    );
  }
}
