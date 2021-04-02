import 'package:flutter/material.dart';
import 'package:hypervolt_bluetooth/ui/core/style.dart';
import 'package:hypervolt_bluetooth/ui/core/AppConfig.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hypervolt_bluetooth/ui/router/router.gr.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // AutoRouter
        builder: ExtendedNavigator.builder<AutoRouter>(router: AutoRouter()),
        title: AppConfig.app_name,
        theme: ThemeData.light().copyWith(
          textTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'Poppins',
          ),
          primaryColor: kPrimaryColor,
          backgroundColor: kPrimaryColor,
          accentColor: kSecondaryColor,
        ),
      ),
    );
  }
}
