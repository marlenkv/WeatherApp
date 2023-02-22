part of 'weather_app_cubit.dart';

@immutable
abstract class WeatherAppState {}

class WeatherAppInitial extends WeatherAppState {}

class WeatherAppFetchedState extends WeatherAppState {
  final WeatherAppModel weatherAppModel;

  WeatherAppFetchedState({required  this.weatherAppModel});
}

class LoadingState extends WeatherAppState {
  // final bool loading;

  // LoadingState({required this.loading});
}

class ErrorState extends WeatherAppState {
  final ErrorsEnum error;

  ErrorState(this.error);
}
