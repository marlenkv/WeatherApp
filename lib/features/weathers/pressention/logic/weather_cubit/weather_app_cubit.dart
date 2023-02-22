import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_weatherapp/features/weathers/domain/USE_CASE/Weather_use_case.dart';
import 'package:flutter_weatherapp/internal/helpers/api_reguester.dart';
import 'package:flutter_weatherapp/features/weathers/data/models/Weather_Model.dart';
import 'package:meta/meta.dart';

import '../../../../../internal/helpers/error_helper.dart';

part 'weather_app_state.dart';

class WeatherAppCubit extends Cubit<WeatherAppState> {
  WeatherAppCubit() : super(WeatherAppInitial());
  WeatherUseCase useCase = WeatherUseCase();
  Future<void> getWeather({required String city}) async {
    await useCase.getWeather(city: city).then((WeatherAppModel) {
      emit(WeatherAppFetchedState(weatherAppModel: WeatherAppModel));
    }).onError((error, stackTrace) {
      if (error is ErrorsEnum) {
        emit(ErrorState(error));
      } else {
        emit(ErrorState(ErrorsEnum.invalidError));
      }
    });
    //   APIRequester apiRequester = APIRequester();

    //   emit(LoadingState());
    //   try {
    //     var response = await apiRequester.toGet(
    //         "data/2.5/weather?q=$city&appid=20de277bfd24db7e71ec9d03f8d7e2b2");
    //     log("${response.data}");
    //     weatherAppModel = WeatherAppModel.fromJson(response.data);
    //     // usermodellist = response.data;
    //     log(weatherAppModel.clouds.all.toString());

    //     emit(WeatherAppFetchedState(weatherAppModel: weatherAppModel));
    //   } catch (error) {
    //     log(error.toString());
    //     if (error is ErrorsEnum) {
    //       emit(ErrorState(error));
    //     } else
    //       emit(ErrorState(ErrorsEnum.invalidError));
    //   }
    // }
  }
}
