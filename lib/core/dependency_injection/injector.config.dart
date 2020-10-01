// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../cubits/auth/auth_cubit.dart';
import '../repositories/auth/auth_repository.dart';
import 'module_injector.dart';
import '../cubits/location/location_cubit.dart';
import '../cubits/navigation/navigation_cubit.dart';
import '../cubits/weather/weather_cubit.dart';
import '../repositories/weather/weather_repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<FlutterAppAuth>(() => injectableModule.flutterAppAuth);
  gh.lazySingleton<FlutterSecureStorage>(
      () => injectableModule.flutterSecureStorage);
  gh.lazySingleton<GeolocatorPlatform>(() => injectableModule.geoLocator);
  gh.lazySingleton<LocationCubit>(
      () => LocationCubit(get<GeolocatorPlatform>()));
  gh.lazySingleton<NavigationCubit>(() => NavigationCubit());
  gh.factory<WeatherRepository>(() => WeatherRepositoryImpl());
  gh.factory<AuthRepository>(() =>
      AuthRepositoryImpl(get<FlutterAppAuth>(), get<FlutterSecureStorage>()));
  gh.lazySingleton<WeatherCubit>(() => WeatherCubit(get<WeatherRepository>()));
  gh.lazySingleton<AuthCubit>(
      () => AuthCubit(get<AuthRepository>(), get<FlutterSecureStorage>()));
  return get;
}

class _$InjectableModule extends InjectableModule {}
