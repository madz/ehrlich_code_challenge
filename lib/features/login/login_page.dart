import 'package:ehrlich_code_challenge/core/cubits/auth/auth_cubit.dart';
import 'package:ehrlich_code_challenge/core/dependency_injection/injector.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final AuthCubit _authCubit = getIt<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text('Hello World'),
          ),
          Center(
            child: RaisedButton(
              child: Text('Log in'),
              onPressed: () {
                _authCubit.logIn();
              },
            ),
          ),
        ],
      ),
    );
  }
}
