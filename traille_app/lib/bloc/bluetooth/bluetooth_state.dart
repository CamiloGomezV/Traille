part of 'bluetooth_bloc.dart';

@immutable
abstract class BluetoothState {
  List<Object> get props;
}

// Initial State
class BluetoothInitialState extends BluetoothState {
  @override
  List<Object> get props => [];
}

class SearchingDevices extends BluetoothState {
  SearchingDevices();
  @override
  List<Object> get props => [];
}

// Device Found
class DevicesFound extends BluetoothState {
  final List<BluetoothDiscoveryResult?> devices;
  DevicesFound({required this.devices});
  @override
  List<Object> get props => [];
}

// Connecting To Device
class ConnectingToDevice extends BluetoothState {
  @override
  List<Object> get props => [];
}

// Device Connected
class DeviceConnected extends BluetoothState {
  @override
  List<Object> get props => [];
}

// Fail Connecting To Device
class BluetoothFail extends BluetoothState {
  final String errorMessage;
  BluetoothFail({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
