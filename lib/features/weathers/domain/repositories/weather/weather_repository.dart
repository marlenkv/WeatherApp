import 'package:flutter_weatherapp/features/weathers/data/models/Weather_Model.dart';

abstract class WeatherRepositry {
  Future<WeatherAppModel> getWeather({required String city});
}
