// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../model/bluetooth_model.dart';
import '../bluetooth_info/device_info.dart';
import '../home/home_page.dart';

class Routes {
  static const String home = '/';
  static const String bluetoothInfo = '/bluetooth-info';
  static const all = <String>{
    home,
    bluetoothInfo,
  };
}

class AutoRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.home, page: Home),
    RouteDef(Routes.bluetoothInfo, page: BluetoothInfo),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Home: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => Home(),
        settings: data,
      );
    },
    BluetoothInfo: (data) {
      final args = data.getArgs<BluetoothInfoArguments>(
        orElse: () => BluetoothInfoArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            BluetoothInfo(bluetoothData: args.bluetoothData),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// BluetoothInfo arguments holder class
class BluetoothInfoArguments {
  final BluetoothModel bluetoothData;
  BluetoothInfoArguments({this.bluetoothData});
}
