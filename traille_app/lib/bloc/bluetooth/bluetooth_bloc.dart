import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:traille_app/utils/bluetooth/bluetooth.dart';

part 'bluetooth_event.dart';
part 'bluetooth_state.dart';

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothState> {
  final BluetoothConn _bluetoothConn = BluetoothConn();

  // final BluetoothDevice device = const BluetoothDevice(address: '');
  BluetoothBloc() : super(BluetoothInitialState()) {
    on<SearchDevices>((event, emit) async {
      emit(SearchingDevices());
      try {
        final bool resp = await _bluetoothConn.stablishBluetoothConnection();
        if (resp == false) {
          emit(BluetoothFail(
              errorMessage: "Ocurrió un error prendiendo el bluetooth"));
          return;
        }
        final List<BluetoothDiscoveryResult?> devices =
            await _bluetoothConn.searchDevices();
        emit(DevicesFound(devices: devices.toList()));
      } catch (exception) {}
    });
    on<ConnectToDevice>((event, emit) async {
      try {
        final bool resp =
            await _bluetoothConn.stablisDeviceConnection(device: event.device);
        if (resp == false) {
          emit(BluetoothFail(
              errorMessage: "Ocurrió un error encontrando los dispositivos"));
        } else {
          emit(DeviceConnected());
        }
      } catch (exception) {}
    });
  }

  // Stream<BluetoothState> mapEventToState(BluetoothEvent event) async* {
  //   if (event is SearchDevices) {
  //     yield* _searchDevices();
  //   } else if (event is ConnectToDevice) {
  //     yield* _connectToDevice(device: event.device);
  //   }
  // }

  // Stream<BluetoothState> _searchDevices(emit) async* {
  //   try {
  //     final bool resp = await _bluetoothConn.stablishBluetoothConnection();
  //     if (resp == false) {
  //       emit(BluetoothFail(
  //           errorMessage: "Ocurrió un error prendiendo el bluetooth"));
  //       return;
  //     }
  //     final List<BluetoothDiscoveryResult?> devices =
  //         await _bluetoothConn.searchDevices();
  //     if (devices == null) {
  //       emit(BluetoothFail(
  //           errorMessage: "Ocurrió un error encontrando los dispositivos"));
  //     } else {
  //       emit(DevicesFound(devices: devices.toList()));
  //     }
  //   } catch (exception) {
  //     emit();
  //   }
  // }

  // Download Data
  // Future<void> _connectToDevice(emit,
  //     {required BluetoothDevice device}) async {
  //   try {
  //     final bool resp =
  //         emit(_bluetoothConn.stablisDeviceConnection(device: device));
  //     if (resp == false) {
  //       emit(BluetoothFail(
  //           errorMessage: "Ocurrió un error encontrando los dispositivos"));
  //     } else {
  //       emit(DeviceConnected());
  //     }
  //   } catch (exception) {}
  // }

}
