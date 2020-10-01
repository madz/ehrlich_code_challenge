part of 'weather_cubit.dart';

@freezed
abstract class WeatherState with _$WeatherState {
  const factory WeatherState({
    WeatherModel weatherModel,
    @required bool isSubmitting,
    @required bool isSuccess,
    @required bool isFailure,
    String info,
  }) = _WeatherState;

  factory WeatherState.empty() => WeatherState(
        weatherModel: WeatherModel(),
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        info: '',
      );

  factory WeatherState.loading() => WeatherState(
        weatherModel: WeatherModel(),
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        info: '',
      );

  factory WeatherState.failure({String info}) => WeatherState(
        weatherModel: WeatherModel(),
        isSubmitting: false,
        isSuccess: false,
        isFailure: true,
        info: info,
      );

  factory WeatherState.success({
    @required weatherModel,
    @required String info,
  }) =>
      WeatherState(
        weatherModel: weatherModel,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        info: info,
      );
}
