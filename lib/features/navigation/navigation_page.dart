import 'package:ehrlich_code_challenge/core/constants/app_constants.dart';
import 'package:ehrlich_code_challenge/core/cubits/navigation/navigation_cubit.dart';
import 'package:ehrlich_code_challenge/core/dependency_injection/injector.dart';
import 'package:ehrlich_code_challenge/features/home/home_page.dart';
import 'package:ehrlich_code_challenge/features/weather/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationPage extends StatelessWidget {
  final NavigationCubit _navigationCubit = getIt<NavigationCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, navigationState) {
        if (navigationState.isHomeScreen) {
          return _buildBodyScreen(
            HomePage(),
            navigationState.index,
          );
        } else {
          return _buildBodyScreen(
            WeatherPage(),
            navigationState.index,
          );
        }
      },
    );
  }

  Widget _buildBodyScreen(Widget screen, int currentIndex) {
    return Scaffold(
      body: screen,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Weather',
            icon: Icon(
              Icons.waves,
            ),
          ),
        ],
      ),
    );
  }

  _onItemTapped(int index) {
    if (index == AppConstants.NAVIGATION_HOME) {
      _navigationCubit.goToHomePage();
    }
    if (index == AppConstants.NAVIGATION_WEATHER) {
      _navigationCubit.goToWeatherPage();
    }
  }
}
