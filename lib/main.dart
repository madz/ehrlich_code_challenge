import 'package:ehrlich_code_challenge/core/dependency_injection/injector.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  /// Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();

  ///configure dependency injections
  configureDependencies();

  runApp(
    App(),
  );
}
