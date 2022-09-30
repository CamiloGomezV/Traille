part of 'bluetooth_bloc.dart';

@immutable
abstract class BluetoothEvent extends Equatable {}

// Initial Event
class BluetoothInitialEvent extends BluetoothEvent {
  @override
  List<Object> get props => [];
}

// Connect To Device
class SearchDevices extends BluetoothEvent {
  SearchDevices();
  @override
  List<Object> get props => [];
}

// Connect To Device
class ConnectToDevice extends BluetoothEvent {
  final BluetoothDevice device;
  ConnectToDevice({required this.device});
  @override
  List<Object> get props => [device];
}
