import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_weatherapp/helpers/api_reguester.dart';
import 'package:flutter_weatherapp/models/Weather_Model.dart';
import 'package:meta/meta.dart';

import '../helpers/error_helper.dart';

part 'weather_app_state.dart';

class WeatherAppCubit extends Cubit<WeatherAppState> {
  WeatherAppCubit() : super(WeatherAppInitial());
  late WeatherAppModel weatherAppModel;
  Future<void> getWeather(String city) async {
    APIRequester apiRequester = APIRequester();

    emit(LoadingState());
    try {
      var response = await apiRequester.toGet(
          "data/2.5/weather?q=$city&appid=20de277bfd24db7e71ec9d03f8d7e2b2");
      log("${response.data}");
      weatherAppModel = WeatherAppModel.fromJson(response.data);
      // usermodellist = response.data;
      log(weatherAppModel.clouds.all.toString());

      emit(WeatherAppFetchedState(weatherAppModel: weatherAppModel));
    } catch (error) {
      log(error.toString());
      if (error is ErrorsEnum) {
        emit(ErrorState(error));
      } else
        emit(ErrorState(ErrorsEnum.invalidError));
    }
  }
}
