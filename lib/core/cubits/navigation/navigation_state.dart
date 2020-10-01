part of 'navigation_cubit.dart';

@freezed
abstract class NavigationState with _$NavigationState {
  const factory NavigationState({
    @required bool isHomeScreen,
    @required bool isWeatherScreen,
    @required int index,
  }) = _NavigationState;

  factory NavigationState.homeScreen(int index) => NavigationState(
        isHomeScreen: true,
        isWeatherScreen: false,
        index: index,
      );

  factory NavigationState.weatherScreen(int index) => NavigationState(
        isHomeScreen: false,
        isWeatherScreen: true,
        index: index,
      );
}
