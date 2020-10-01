import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

part 'location_cubit.freezed.dart';
part 'location_state.dart';

@lazySingleton
class LocationCubit extends Cubit<LocationState> {
  final GeolocatorPlatform _geoLocator;
  LocationCubit(this._geoLocator) : super(LocationState.empty());

  getUserLocation() async {
    try {
      emit(LocationState.loading());
      Position position = await _geoLocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      emit(LocationState.success(position: position, info: 'Success'));
    } on Exception catch (e) {
      emit(
        LocationState.failure(
            info:
                'There was an error in getting your location. ${e.toString()}'),
      );
    }
  }
}
