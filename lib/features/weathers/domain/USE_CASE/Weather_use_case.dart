import 'package:flutter_weatherapp/features/weathers/data/repositories/weather_repository_impl.dart';
import 'package:flutter_weatherapp/features/weathers/domain/repositories/weather/weather_repository.dart';

import '../../data/models/Weather_Model.dart';

class WeatherUseCase {
  WeatherRepositoryimpl weatherRepositoryimpl = WeatherRepositoryimpl();
  Future<WeatherAppModel> getWeather({required String city}) =>
      weatherRepositoryimpl.getWeather(city: city);
}
