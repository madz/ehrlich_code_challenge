import 'dart:convert';

import 'package:ehrlich_code_challenge/core/constants/app_constants.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class AuthRepository {
  Future<bool> logIn();
  void logOut();
}

@Injectable(as: AuthRepository)
@lazySingleton
class AuthRepositoryImpl implements AuthRepository {
  FlutterAppAuth _appAuth;
  FlutterSecureStorage _secureStorage;
  AuthRepositoryImpl(this._appAuth, this._secureStorage);

  @override
  Future<bool> logIn() async {
    try {
      final AuthorizationTokenResponse result =
          await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AppConstants.AUTH0_CLIENT_ID,
          AppConstants.AUTH0_REDIRECT_URI,
          issuer: AppConstants.AUTH0_BASE_URL,
          scopes: ['openid', 'profile', 'offline_access'],
          promptValues: ['login'],
        ),
      );

      final Map<String, dynamic> profile =
          await _getUserDetails(result.accessToken);

      final String githubUserName = profile['nickname'];
      final String fullName = profile['name'];

      print('profile = $profile');
      print('githubUserName = $githubUserName');

      await _secureStorage.write(
          key: AppConstants.AUTH_REFRESH_TOKEN, value: result.refreshToken);
      await _secureStorage.write(
          key: AppConstants.AUTH_GITHUB_USERNAME, value: githubUserName);
      await _secureStorage.write(
          key: AppConstants.AUTH_FULL_NAME, value: fullName);

      return true;
    } catch (e, s) {
      print('login error: $e - stack: $s');
      return false;
    }
  }

  void logOut() async {
    // Delete all
    await _secureStorage.deleteAll();
  }

  Future<Map<String, dynamic>> _getUserDetails(String accessToken) async {
    final url = '${AppConstants.AUTH0_BASE_URL}/userinfo';
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }
}
