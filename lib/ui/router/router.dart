import 'package:auto_route/auto_route_annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hypervolt_bluetooth/ui/bluetooth_info/device_info.dart';
import 'package:hypervolt_bluetooth/ui/home/home_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute(page: Home, initial: true),
    CustomRoute(
      page: BluetoothInfo, transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ],
)
class $AutoRouter {}