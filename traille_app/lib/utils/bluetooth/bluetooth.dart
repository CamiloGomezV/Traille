import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothConn {
  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  String? connectedForUseAddress;
  BluetoothDevice? connectedDevice;
  static BluetoothConn? _singleton;

  // Builders
  factory BluetoothConn() {
    _singleton ??= BluetoothConn._internal();
    return _singleton!;
  }

  BluetoothConn._internal();

  Future<bool> stablishBluetoothConnection() async {
    bool? enabled = await _bluetooth.isEnabled;
    if (enabled == false) {
      enabled = await _bluetooth.requestEnable();
      if (enabled == false) {
        return false;
      }
    }
    return true;
  }

  Future<List<BluetoothDiscoveryResult?>> searchDevices() async {
    List<BluetoothDiscoveryResult> availableDevs =
        await _bluetooth.startDiscovery().toList();

    List<String> availableAdds =
        availableDevs.map((device) => device.device.address).toSet().toList();
    return availableDevs.map((device) {
      if (availableAdds.contains(device.device.address)) {
        availableAdds.remove(device.device.address);
        return device;
      }
    }).toList();
  }

  Future<bool> stablisDeviceConnection(
      {required BluetoothDevice device}) async {
    bool resp = false;
    final BluetoothBondState state = await _bluetooth.getBondStateForAddress(device.address);
    if (state == BluetoothBondState.bonded) {
      connectedDevice = device;
      resp = true;
    }
    else{
      resp = (await _bluetooth.bondDeviceAtAddress(device.address))!;
      if (resp) {
        connectedDevice = device;
      }
      return resp;
    }
    return resp;
  }
}
