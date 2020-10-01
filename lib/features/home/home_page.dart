import 'package:ehrlich_code_challenge/core/cubits/auth/auth_cubit.dart';
import 'package:ehrlich_code_challenge/core/cubits/location/location_cubit.dart';
import 'package:ehrlich_code_challenge/core/cubits/weather/weather_cubit.dart';
import 'package:ehrlich_code_challenge/core/dependency_injection/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final AuthCubit _authCubit = getIt<AuthCubit>();
  final LocationCubit _locationCubit = getIt<LocationCubit>();
  final WeatherCubit _weatherCubit = getIt<WeatherCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _authCubit.logOut();
            },
          ),
        ],
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (_, authState) {
          return BlocBuilder<LocationCubit, LocationState>(
            builder: (_, locationState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Name = ${authState.fullName}',
                      ),
                      Text(
                        'Github link = https://github.com/${authState.githubUsername}',
                      ),
                    ],
                  ),
                  Divider(),
                  Column(
                    children: [
                      RaisedButton(
                        child: Text('Get Location'),
                        onPressed: () async {
                          await _locationCubit.getUserLocation();
                          await _weatherCubit
                              .getWeather(_locationCubit.state.position);
                        },
                      ),
                      Visibility(
                        visible: locationState.isSuccess,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Latitude = ${locationState.position.latitude}',
                              ),
                              Text(
                                'Longitude = ${locationState.position.longitude}',
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
