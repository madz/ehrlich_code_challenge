part of 'location_cubit.dart';

@freezed
abstract class LocationState with _$LocationState {
  const factory LocationState({
    @required Position position,
    @required bool isSubmitting,
    @required bool isSuccess,
    @required bool isFailure,
    String info,
  }) = _LocationState;

  factory LocationState.empty() => LocationState(
        position: Position(),
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        info: '',
      );

  factory LocationState.loading() => LocationState(
        position: Position(),
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        info: '',
      );

  factory LocationState.failure({String info}) => LocationState(
        position: Position(),
        isSubmitting: false,
        isSuccess: false,
        isFailure: true,
        info: info,
      );

  factory LocationState.success({@required position, @required String info}) =>
      LocationState(
        position: position,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        info: info,
      );
}
