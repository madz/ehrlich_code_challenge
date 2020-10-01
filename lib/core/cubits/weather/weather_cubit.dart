import 'package:ehrlich_code_challenge/core/models/weather_model.dart';
import 'package:ehrlich_code_challenge/core/repositories/weather/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

part 'weather_cubit.freezed.dart';
part 'weather_state.dart';

@lazySingleton
class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherState.empty());

  getWeather(Position position) async {
    try {
      emit(WeatherState.loading());
      if (position != null) {
        final WeatherModel weatherModel =
            await _weatherRepository.getUserWeatherUsingCoordinates(position);
        if (weatherModel != null) {
          emit(
            WeatherState.success(
                weatherModel: weatherModel,
                info: 'Success in getting your weather info.'),
          );
        } else {
          emit(
            WeatherState.failure(
                info: 'There was an error in getting your weather info.'),
          );
        }
      } else {
        emit(
          WeatherState.failure(
              info: 'There was an error in getting your weather info.}'),
        );
      }
    } on Exception catch (e) {
      emit(
        WeatherState.failure(
            info:
                'There was an error in getting your weather info. ${e.toString()}'),
      );
    }
  }
}
