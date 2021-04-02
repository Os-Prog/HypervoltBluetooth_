import 'package:flutter/material.dart';
import 'package:hypervolt_bluetooth/model/bluetooth_model.dart';
import 'package:hypervolt_bluetooth/ui/core/style.dart';

class BluetoothInfo extends StatefulWidget {
  final BluetoothModel bluetoothData;
  BluetoothInfo({this.bluetoothData});


  @override
  _BluetoothInfoState createState() => _BluetoothInfoState(this.bluetoothData);
}

class _BluetoothInfoState extends State<BluetoothInfo> {
  final BluetoothModel bluetoothData;
  _BluetoothInfoState(this.bluetoothData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back to Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Text(bluetoothData?.name ?? '', style: kBodyText1.copyWith(
                  color: kSecondaryIconColor, fontSize: 16.0, fontWeight: FontWeight.w800),)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Text(bluetoothData?.address ?? '', style: kBodyText1.copyWith(
                      color: kSecondaryIconColor, fontSize: 14.0, fontWeight: FontWeight.w600)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
