import 'package:ehrlich_code_challenge/core/cubits/weather/weather_cubit.dart';
import 'package:ehrlich_code_challenge/core/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        centerTitle: true,
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (_, weatherState) {
          final WeatherModel weatherModel = weatherState.weatherModel;
          if (weatherState.isSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text('City = ${weatherModel.name}'),
                      Text('Country = ${weatherModel.sys.country}'),
                      Text('Weather = ${weatherModel.weather[0].main}'),
                    ],
                  ),
                ),
              ],
            );
          } else if (weatherState.isFailure) {
            return Center(
              child: Text(weatherState.info),
            );
          } else {
            return Center(
              child: Text(
                'Could not find location coordinates to gather weather info.',
              ),
            );
          }
        },
      ),
    );
  }
}
