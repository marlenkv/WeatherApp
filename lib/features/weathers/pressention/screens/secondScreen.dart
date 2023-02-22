import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_weatherapp/features/weathers/pressention/screens/firstScreen.dart';
import 'package:flutter_weatherapp/internal/helpers/color_helper.dart';
import 'package:flutter_weatherapp/internal/helpers/error_helper.dart';
import 'package:flutter_weatherapp/internal/helpers/text_helper.dart';
import 'package:flutter_weatherapp/main.dart';
import 'package:flutter_weatherapp/features/weathers/data/models/Weather_Model.dart';
import 'package:intl/intl.dart';

import '../../../../internal/helpers/function_helper.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_weatherapp/cubit/weather_app_cubit.dart';
// import 'package:flutter_weatherapp/models/Weather_Model.dart';

class SecondPage extends StatefulWidget {
  final WeatherAppModel weatherAppModel;
  const SecondPage({super.key, required this.weatherAppModel});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // WeatherAppCubit _appCubit = WeatherAppCubit();
  @override
  void initState() {
    // _appCubit.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: icon,
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                  color: ColorHeler.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: ColorHeler.darkGrey.withOpacity(0.5.r),
                  //     spreadRadius: 5.r,
                  //     blurRadius: 7.r,
                  //     offset: Offset(0, 3.r), // changes position of shadow
                  //   ),
                  // ],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                alignment: Alignment.center,
                child: Text(widget.weatherAppModel.sys.country,
                    style: textHelper.w500s15
                        .copyWith(color: ColorHeler.textBlack)),
              ),
              Container(
                width: 100.r,
                height: 30.r,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.purple, Colors.blue])),
                child: Center(
                    child: Text(widget.weatherAppModel.name,
                        style: textHelper.w500s15
                            .copyWith(color: ColorHeler.white))),
              ),
              Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [ColorHeler.purple, Colors.blue])),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.search,
                      color: ColorHeler.white,
                      size: 20.r,
                    )),
              )
            ],
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                getDataFormat(widget.weatherAppModel.dt!).toString(),
                style: textHelper.w600s20,
              )),
          SizedBox(
            height: 5.r,
          ),
          Container(
            width: 1.sw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.purple, Colors.blue])),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Row(
                children: [
                  Image.asset(
                    getIcons(
                      widget.weatherAppModel.weather[0].icon,
                    ),
                    height: 150,
                  ),
                
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Feels like",
                            style: textHelper.w700s15
                                .copyWith(color: ColorHeler.white),
                          ),
                          SizedBox(
                            width: 5.r,
                          ),
                          Text(
                            getCels(widget.weatherAppModel.main.feelsLike!)
                                .toString(),
                            style: textHelper.w700s15
                                .copyWith(color: ColorHeler.white),
                          ),
                          Text(
                            "°",
                            style: textHelper.w700s15
                                .copyWith(color: ColorHeler.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              getCels(widget.weatherAppModel.main.temp!)
                                  .toString(),
                              style: textHelper.w500s75
                                  .copyWith(color: ColorHeler.white)),
                          Text("°",
                              style: textHelper.w500s75
                                  .copyWith(color: ColorHeler.white)),
                        ],
                      ),
                      Text(
                        widget.weatherAppModel.weather[0].description,
                        style: textHelper.w500s15
                            .copyWith(color: ColorHeler.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5.r,
          ),
          Text(
            getTimeFormat(widget.weatherAppModel.dt!).toString(),
            style: textHelper.w600s20,
          ),
          SizedBox(
            height: 5.r,
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorHeler.white.withOpacity(0.1.r),
                borderRadius: BorderRadius.circular(25.r),
                // border: Border.all(width: 2, color: Colors.white30),
                boxShadow: [
                  BoxShadow(
                      color: ColorHeler.textBlack.withOpacity(0.3.r),
                      blurRadius: 25.r,
                      spreadRadius: -5.r)
                ]),
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(widget.weatherAppModel.sys.sunrise.toString())
                  Column(
                    children: [
                      Icon(Icons.sunny_snowing),
                      Text(
                        getTimeFormat(widget.weatherAppModel.sys.sunrise!),
                        style: textHelper.w500s15
                            .copyWith(color: ColorHeler.white),
                      ),
                      Text(
                        "sunrise",
                        style: textHelper.w400s13
                            .copyWith(color: ColorHeler.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.lightbulb_sharp),
                      Text(
                        getTimeFormat(widget.weatherAppModel.sys.sunset!),
                        style: textHelper.w500s15
                            .copyWith(color: ColorHeler.white),
                      ),
                      Text(
                        "sunset",
                        style: textHelper.w400s13
                            .copyWith(color: ColorHeler.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.r,
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorHeler.white.withOpacity(0.1.r),
                borderRadius: BorderRadius.circular(25.r),
                // border: Border.all(width: 2, color: Colors.white30),
                boxShadow: [
                  BoxShadow(
                      color: ColorHeler.textBlack.withOpacity(0.3.r),
                      blurRadius: 25.r,
                      spreadRadius: -5.r)
                ]),
            child: Padding(
              padding: EdgeInsets.all(30.r),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.wind_power),
                          Text(
                            widget.weatherAppModel.wind.speed.toString(),
                            style: textHelper.w500s15
                                .copyWith(color: ColorHeler.white),
                          ),
                          Text("wind speed",
                              style: textHelper.w400s13
                                  .copyWith(color: ColorHeler.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.invert_colors),
                          Text(
                            widget.weatherAppModel.main.humidity.toString(),
                            style: textHelper.w500s15
                                .copyWith(color: ColorHeler.white),
                          ),
                          Text("humidity",
                              style: textHelper.w400s13
                                  .copyWith(color: ColorHeler.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.waves_outlined),
                          Text(
                            widget.weatherAppModel.main.seaLevel.toString(),
                            style: textHelper.w500s15
                                .copyWith(color: ColorHeler.white),
                          ),
                          Text("sea level",
                              style: textHelper.w400s13
                                  .copyWith(color: ColorHeler.white)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.wind_power),
                          Text(
                            widget.weatherAppModel.wind.speed.toString(),
                            style: textHelper.w500s15
                                .copyWith(color: ColorHeler.white),
                          ),
                          Text("wind speed",
                              style: textHelper.w400s13
                                  .copyWith(color: ColorHeler.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.invert_colors),
                          Text(
                            widget.weatherAppModel.main.humidity.toString(),
                            style: textHelper.w500s15
                                .copyWith(color: ColorHeler.white),
                          ),
                          Text("humidity",
                              style: textHelper.w400s13
                                  .copyWith(color: ColorHeler.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.waves_outlined),
                          Text(
                            widget.weatherAppModel.main.seaLevel.toString(),
                            style: textHelper.w500s15
                                .copyWith(color: ColorHeler.white),
                          ),
                          Text("sea level",
                              style: textHelper.w400s13
                                  .copyWith(color: ColorHeler.white)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.r,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "data provided from",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                " https://openweathermap.org",
                style: TextStyle(color: Colors.amber.shade900),
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}
