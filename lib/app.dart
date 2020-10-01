import 'package:ehrlich_code_challenge/core/cubits/auth/auth_cubit.dart';
import 'package:ehrlich_code_challenge/core/cubits/location/location_cubit.dart';
import 'package:ehrlich_code_challenge/core/cubits/navigation/navigation_cubit.dart';
import 'package:ehrlich_code_challenge/core/cubits/weather/weather_cubit.dart';
import 'package:ehrlich_code_challenge/core/dependency_injection/injector.dart';
import 'package:ehrlich_code_challenge/features/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) =>
              getIt<AuthCubit>()..authCheckRequested(),
        ),
        BlocProvider<NavigationCubit>(
          create: (BuildContext context) => getIt<NavigationCubit>(),
        ),
        BlocProvider<LocationCubit>(
          create: (BuildContext context) => getIt<LocationCubit>(),
        ),
        BlocProvider<WeatherCubit>(
          create: (BuildContext context) => getIt<WeatherCubit>(),
        ),
      ],
      child: MaterialApp(
        home: AuthPage(),
      ),
    );
  }
}
