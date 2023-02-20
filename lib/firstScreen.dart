import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weatherapp/cubit/weather_app_cubit.dart';
import 'package:flutter_weatherapp/helpers/color_helper.dart';
import 'package:flutter_weatherapp/helpers/text_helper.dart';
import 'package:flutter_weatherapp/main.dart';
import 'package:flutter_weatherapp/models/Weather_Model.dart';

import 'secondScreen.dart';
import 'helpers/error_helper.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({
    super.key,
  });

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // final WeatherAppModel weatherAppModel;
  final WeatherAppCubit _appCubit = WeatherAppCubit();

  final TextEditingController controller = TextEditingController();

  // final WeatherAppCubit? weatherAppCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WeatherAppCubit, WeatherAppState>(
        listener: (context, state) {
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(getErrors(context, state.error))));
          }
          if (state is WeatherAppFetchedState) {
            Navigator.push(context, MaterialPageRoute(builder: ((context) {
              return SecondPage(
                weatherAppModel: state.weatherAppModel,
              );
            })));
          }
          // TODO: implement listener
        },
        bloc: _appCubit,
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
                child: CircularProgressIndicator(
              color: ColorHeler.purple,
            ));
          }
          if (state is ErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(getErrors(context, state.error),
                      style: textHelper.w700s30),
                ),
                Container(
                  width: 50.r,
                  height: 50.r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.purple, Colors.blue])),
                  child: IconButton(
                      onPressed: () {
                        _appCubit.getWeather(controller.text);
                      },
                      icon: Icon(
                        Icons.repeat,
                        color: ColorHeler.white,
                        size: 20.r,
                      )),
                ),
              ],
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      // focusColor: Colors.grey,
                      hintText: "Search city",
                      hintStyle: textHelper.w500s15,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide(
                          color: ColorHeler.darkGrey,
                        ),
                      ),
                      border: OutlineInputBorder(
                          // borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(30.r)),
                      icon: Container(
                        width: 50.r,
                        height: 50.r,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [ColorHeler.purple, Colors.blue])),
                        child: IconButton(
                            onPressed: () {
                              if (controller.text.isNotEmpty) {
                                _appCubit.getWeather(controller.text);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Зопалните поле")));
                              }
                            },
                            icon: Icon(
                              Icons.search,
                              color: ColorHeler.white,
                              size: 20.r,
                            )),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
