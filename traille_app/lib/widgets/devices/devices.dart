import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:traille_app/bloc/bluetooth/bluetooth_bloc.dart' as blocs;
import 'package:traille_app/utils/notifications/notifications.dart';
import 'package:traille_app/utils/responsive/responsive.dart';

class DevicesWidget extends StatefulWidget {
  final List<BluetoothDiscoveryResult?> devices;

  const DevicesWidget({Key? key, required this.devices}) : super(key: key);

  @override
  _DevicesWidgetState createState() => _DevicesWidgetState();
}

class _DevicesWidgetState extends State<DevicesWidget> {
  blocs.BluetoothBloc? _bluetoothBloc;
  @override
  void initState() {
    _bluetoothBloc = blocs.BluetoothBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bluetoothBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context: context);
    return BlocListener<blocs.BluetoothBloc, blocs.BluetoothState>(
        bloc: _bluetoothBloc,
        listener: (BuildContext context, blocs.BluetoothState state) {
          if (state is blocs.DeviceConnected) {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, '/homepage');
          } else if (state is blocs.BluetoothFail) {
            showNotification(context, state.errorMessage, responsive);
          }
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 6,
            sigmaY: 6,
          ),
          child: AlertDialog(
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(responsive.wp(15))),
              elevation: 2,
              content: Container(
                  height: responsive.hp(60),
                  width: responsive.wp(80),
                  padding: EdgeInsets.symmetric(
                      horizontal: responsive.wp(4), vertical: responsive.hp(2)),
                  child: Column(
                    children: [
                      SizedBox(height: responsive.hp(5),),
                      Center(
                        child: Text(
                          "Seleccione un dispositivo",
                          style: TextStyle(color:  const Color.fromRGBO(21, 191, 174, 1), fontSize: responsive.wp(5)),
                        ),
                      ),
                      SizedBox(height: responsive.hp(3),),
                      Expanded(
                        child: ListView.separated(
                          itemCount: widget.devices.length,
                          itemBuilder: (context, index) => DeviceWidget(
                            device: widget.devices[index]!,
                            callback:(device) =>{
                              _bluetoothBloc?.add(blocs.ConnectToDevice(device: device))}),
                          separatorBuilder: (context, _) => Container(
                            height: responsive.wp(1),
                          ),
                        ),
                      ),
                    ],
                  )),
              actions: const []),
        ));
  }
}

class DeviceWidget extends StatelessWidget {
  final BluetoothDiscoveryResult device;
  final Function(BluetoothDevice) callback;
  const DeviceWidget({Key? key, required this.device, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context: context);
    return GestureDetector(
      onTap: () => callback.call(device.device),
      child: Container(
        decoration: BoxDecoration(
            color:  const Color.fromRGBO(21, 191, 174, 1),
            borderRadius: BorderRadius.circular(responsive.wp(2))),
        padding: EdgeInsets.only(
            top: responsive.wp(3),
            bottom: responsive.wp(3),
            left: responsive.wp(4)),
        child: Text(
          device.device.name ?? device.device.address,
          style: TextStyle(color: Colors.white, fontSize: responsive.wp(4)),
        ),
      ),
    );
  }
}
