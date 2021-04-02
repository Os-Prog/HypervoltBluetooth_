import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';
import 'package:hypervolt_bluetooth/model/bluetooth_model.dart';
import 'package:hypervolt_bluetooth/ui/core/appConfig.dart';
import 'package:hypervolt_bluetooth/ui/router/router.gr.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _data = '';
  List<BluetoothModel> devices = [];
  bool _scanning = false;
  FlutterScanBluetooth _bluetooth = FlutterScanBluetooth();

  @override
  void initState() {
    super.initState();
    _bluetooth.startScan();

    _bluetooth.devices.listen((device) {
      setState(() {
        BluetoothModel newBluetooth = BluetoothModel(
          name: device.name,
          address: device.address,
          paired: device.paired
        );

        if ((devices.firstWhere((it) => it.name == newBluetooth.name, orElse: () => null)) != null) {
          print('Bluetooth Already exists');
        } else {
          devices.add(newBluetooth);
          print('New Bluetooth added');
        }
      });
    });
    _bluetooth.scanStopped.listen((device) {
      setState(() {
        _scanning = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConfig.app_name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Flexible is here Incase the text is too long
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Available bluetooth', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(devices.length, (index) {
                BluetoothModel currentDevice = devices.elementAt(index);
                return Card(
                    child: ListTile(
                      onTap: () => ExtendedNavigator.of(context).push(Routes.bluetoothInfo, arguments: BluetoothInfoArguments(bluetoothData: currentDevice)),
                      title: Text(currentDevice.name ?? ''),
                    ),
                  );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: RaisedButton(child: Text(_scanning ? 'Stop scan' : 'Start scan'), onPressed: () async {
                try {
                  if(_scanning) {
                    await _bluetooth.stopScan();
                    debugPrint("scanning stoped");
                    setState(() {
                      _data = '';
                    });
                  }
                  else {
                    await _bluetooth.startScan(pairedDevices: true);
                    debugPrint("scanning started");
                    setState(() {
                      _scanning = true;
                    });
                  }
                } on PlatformException catch (e) {
                  debugPrint(e.toString());
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
