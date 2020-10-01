import 'package:dio/dio.dart';
import 'package:ehrlich_code_challenge/core/constants/app_constants.dart';
import 'package:ehrlich_code_challenge/core/models/weather_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

abstract class WeatherRepository {
  getUserWeatherUsingCoordinates(Position position);
}

@Injectable(as: WeatherRepository)
@lazySingleton
class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<WeatherModel> getUserWeatherUsingCoordinates(Position position) async {
    WeatherModel weatherModel;
    try {
      final urlWeather =
          "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=${AppConstants.OPEN_WEATHER_API}";
      print('urlWeather = $urlWeather');
      Response response = await Dio().get(urlWeather);

      if (response.statusCode == 200) {
        weatherModel = WeatherModel.fromJson(response.data);
      }
      print(response);
    } catch (e) {
      print(e);
    }

    return weatherModel;
  }
}
