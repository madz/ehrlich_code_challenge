import 'package:ehrlich_code_challenge/core/cubits/weather/weather_cubit.dart';
import 'package:ehrlich_code_challenge/core/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:intl/intl.dart';

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
          final DateTime date = DateTime.now();

          var formatDate = DateFormat.yMd().format(date);
          if (weatherState.isSuccess) {
            if (Device.get().isTablet) {
              return GridView.count(
                crossAxisCount: 6,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        child: Text(
                          'Date \n (mm/dd/yyyy)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Card(
                        child: Text(
                          '$formatDate',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        child: Text(
                          'Temp(F)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Card(
                        child: Text(
                          '${weatherModel.main.temp}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Card(
                        child: Text(
                          '${weatherModel.weather[0].description}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        child: Text(
                          'Main',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Card(
                        child: Text(
                          '${weatherModel.weather[0].main}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        child: Text(
                          'Pressure',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Card(
                        child: Text(
                          '${weatherModel.main.pressure}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        child: Text(
                          'Humidity',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Card(
                        child: Text(
                          '${weatherModel.main.humidity}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return GridView.count(
              crossAxisCount: 2,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      child: Text(
                        'Date(mm/dd/yyyy)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Card(
                      child: Text(
                        '$formatDate',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      child: Text(
                        'Temperature(F)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Card(
                      child: Text(
                        '${weatherModel.main.temp}',
                        textAlign: TextAlign.center,
                      ),
                    ),
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
