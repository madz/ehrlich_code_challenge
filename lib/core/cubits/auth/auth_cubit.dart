import 'package:ehrlich_code_challenge/core/constants/app_constants.dart';
import 'package:ehrlich_code_challenge/core/repositories/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final FlutterSecureStorage _secureStorage;
  AuthCubit(
    this._authRepository,
    this._secureStorage,
  ) : super(AuthState.empty());

  authCheckRequested() async {
    emit(AuthState.loading());

    final String storedRefreshToken =
        await _secureStorage.read(key: AppConstants.AUTH_REFRESH_TOKEN);
    final String githubUsername =
        await _secureStorage.read(key: AppConstants.AUTH_GITHUB_USERNAME);
    final String fullName =
        await _secureStorage.read(key: AppConstants.AUTH_FULL_NAME);
    if (storedRefreshToken != null) {
      emit(AuthState.authenticated(
        githubUsername: githubUsername,
        fullName: fullName,
        info: 'User Authenticated',
      ));
    } else {
      emit(AuthState.notAuthenticated('User Not Authenticated'));
    }
  }

  logIn() async {
    emit(AuthState.loading());
    bool isAuth = await _authRepository.logIn();
    if (isAuth) {
      final String githubUsername =
          await _secureStorage.read(key: AppConstants.AUTH_GITHUB_USERNAME);
      final String fullName =
          await _secureStorage.read(key: AppConstants.AUTH_FULL_NAME);
      emit(AuthState.authenticated(
        githubUsername: githubUsername,
        fullName: fullName,
        info: 'User Authenticated',
      ));
    } else {
      emit(AuthState.notAuthenticated('User Not Authenticated'));
    }
  }

  logOut() async {
    emit(AuthState.loading());
    _authRepository.logOut();
    emit(AuthState.notAuthenticated('User Not Authenticated'));
  }
}
