class AppConstants {
  static const String AUTH0_BASE_URL = "https://dev-xltk15iv.us.auth0.com";

  static const String AUTH0_DOMAIN = 'dev-xltk15iv.us.auth0.com';
  static const String AUTH0_CLIENT_ID = 'Gzf57QFbIg1gLHdofbgpU2YcgLTF48yB';

  static const String AUTH0_REDIRECT_URI =
      'com.example.ehrlich://login-callback';
  static const String AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';

  static const int NAVIGATION_HOME = 0;
  static const int NAVIGATION_WEATHER = 1;

  static const String OPEN_WEATHER_API = 'c73ed1a02b801af18760cfe3333a276d';

  static const String AUTH_REFRESH_TOKEN = 'refresh_token';
  static const String AUTH_GITHUB_USERNAME = 'github_username';
  static const String AUTH_FULL_NAME = 'full_name';
}
