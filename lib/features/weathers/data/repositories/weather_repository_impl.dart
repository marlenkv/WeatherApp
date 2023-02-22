import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_weatherapp/features/weathers/data/models/Weather_Model.dart';
import 'package:flutter_weatherapp/features/weathers/domain/repositories/weather/weather_repository.dart';

import '../../../../internal/helpers/api_reguester.dart';
import '../../pressention/logic/weather_cubit/weather_app_cubit.dart';

class WeatherRepositoryimpl implements WeatherRepositry {
  APIRequester apiRequester = APIRequester();
  @override
  Future<WeatherAppModel> getWeather({required String city}) async {
    // TODO: implement getWeather

    try {
      Response response = await apiRequester.toGet(
          "data/2.5/weather?q=$city&appid=20de277bfd24db7e71ec9d03f8d7e2b2",
          queryParameters: {});

      log("${response.data.toString()}");
      WeatherAppModel weatherAppModel = WeatherAppModel.fromJson(response.data);
      // usermodellist = response.data;
      log(weatherAppModel.clouds.all.toString());
      return weatherAppModel;
    } catch (error) {
      rethrow;
    }
  }
}
