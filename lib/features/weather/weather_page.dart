import 'package:ehrlich_code_challenge/core/cubits/weather/weather_cubit.dart';
import 'package:ehrlich_code_challenge/core/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

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
            if (Device.get().isTablet) {
              return GridView.count(
                crossAxisCount: 3,
                children: [
                  Column(
                    children: [
                      Text('City'),
                      Text('${weatherModel.name}'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Country'),
                      Text('${weatherModel.sys.country}'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Weather'),
                      Text('${weatherModel.weather[0].main}'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Temperature'),
                      Text('${weatherModel.main.temp}'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Wind speed'),
                      Text('${weatherModel.wind.speed}'),
                    ],
                  ),
                ],
              );
            }
            return GridView.count(
              crossAxisCount: 3,
              children: [
                Column(
                  children: [
                    Text('City'),
                    Text('${weatherModel.name}'),
                  ],
                ),
                Column(
                  children: [
                    Text('Country'),
                    Text('${weatherModel.sys.country}'),
                  ],
                ),
                Column(
                  children: [
                    Text('Weather'),
                    Text('${weatherModel.weather[0].main}'),
                  ],
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
