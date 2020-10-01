import 'package:ehrlich_code_challenge/core/constants/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'navigation_cubit.freezed.dart';
part 'navigation_state.dart';

@lazySingleton
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(NavigationState.homeScreen(AppConstants.NAVIGATION_HOME));

  goToHomePage() {
    emit(NavigationState.homeScreen(AppConstants.NAVIGATION_HOME));
  }

  goToWeatherPage() {
    emit(NavigationState.weatherScreen(AppConstants.NAVIGATION_WEATHER));
  }
}
