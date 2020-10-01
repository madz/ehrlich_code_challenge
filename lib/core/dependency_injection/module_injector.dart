import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  FlutterAppAuth get flutterAppAuth => FlutterAppAuth();
  @lazySingleton
  FlutterSecureStorage get flutterSecureStorage => FlutterSecureStorage();
  @lazySingleton
  GeolocatorPlatform get geoLocator => GeolocatorPlatform.instance;
}
