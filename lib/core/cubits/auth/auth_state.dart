part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @required String githubUsername,
    @required String fullName,
    @required bool isAuth,
    @required bool isSubmitting,
    @required bool isSuccess,
    @required bool isFailure,
    @required String info,
  }) = _AuthState;

  factory AuthState.empty() => AuthState(
        githubUsername: '',
        fullName: '',
        isAuth: false,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        info: '',
      );

  factory AuthState.loading() => AuthState(
        githubUsername: '',
        fullName: '',
        isAuth: false,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        info: '',
      );

  factory AuthState.notAuthenticated(String info) => AuthState(
        githubUsername: '',
        fullName: '',
        isAuth: false,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        info: info,
      );

  factory AuthState.authenticated({
    @required String githubUsername,
    @required String fullName,
    String info,
  }) =>
      AuthState(
        githubUsername: githubUsername,
        fullName: fullName,
        isAuth: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        info: info,
      );
}
