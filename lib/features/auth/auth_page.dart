import 'dart:io';

import 'package:ehrlich_code_challenge/core/cubits/auth/auth_cubit.dart';
import 'package:ehrlich_code_challenge/core/shared/loading_widget.dart';
import 'package:ehrlich_code_challenge/features/login/login_page.dart';
import 'package:ehrlich_code_challenge/features/navigation/navigation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  final LoadingWidget _loadingWidget = LoadingWidget();

  @override
  Widget build(BuildContext context) {
    bool isShowDialog = false;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (_, authState) {
        if (authState.isSubmitting) {
          if (Platform.isIOS) {
            _loadingWidget.showCupertinoDialog(context);
          } else {
            _loadingWidget.showMaterialDialog(context);
          }
          isShowDialog = true;
        }

        if (authState.isSuccess) {
          if (isShowDialog) {
            Navigator.of(context).pop();
            isShowDialog = false;
          }
        }
      },
      builder: (_, authState) {
        if (authState.isAuth) {
          return NavigationPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
