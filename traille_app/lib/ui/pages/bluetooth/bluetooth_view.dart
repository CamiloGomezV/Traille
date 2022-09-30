import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traille_app/bloc/bluetooth/bluetooth_bloc.dart';
import 'package:traille_app/utils/notifications/notifications.dart';
import 'package:traille_app/utils/responsive/responsive.dart';
import 'package:traille_app/widgets/devices/devices.dart';

class BluetoothView extends StatefulWidget {
  const BluetoothView({Key? key}) : super(key: key);

  @override
  _BluetoothViewState createState() => _BluetoothViewState();
}

class _BluetoothViewState extends State<BluetoothView> {
  late BluetoothBloc _bluetoothBloc;
  @override
  void initState() {
    _bluetoothBloc = BluetoothBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context: context);
    return Scaffold(
        body: BlocListener<BluetoothBloc, BluetoothState>(
      bloc: _bluetoothBloc,
      listener: (BuildContext context, BluetoothState state) async {
        if (state is DevicesFound) {
          state.devices.removeWhere((device) => device == null);
          await showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) =>
                  DevicesWidget(devices: state.devices));
        } else if (state is BluetoothFail) {
          showNotification(context, state.errorMessage, responsive);
        }
      },
      child: SafeArea(
        child: SizedBox(
          width: responsive.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: responsive.wp(95),
                width: responsive.wp(80),
                decoration:  BoxDecoration(
                  color: const Color.fromRGBO(21, 191, 174, 1),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: Offset(responsive.wp(1), responsive.hp(2)), // changes position of shadow
                    ),
                  ],
                ),
              child: Column(
                children: [
                  SizedBox(height: responsive.hp(10)),
                  SvgPicture.asset(
                      'assets/icons/bluetooth.svg',
                      width: responsive.wp(20),
                      height: responsive.hp(20),
                      fit: BoxFit.scaleDown,
                    ),
                  SizedBox(height: responsive.hp(5)),
                  BlocBuilder<BluetoothBloc, BluetoothState>(
                  bloc: _bluetoothBloc,
                  builder: (BuildContext context, BluetoothState state) {
                    if (state is SearchingDevices) {
                      return const CircularProgressIndicator(color: Colors.black,);
                    } else {
                      return GestureDetector(
                        onTap: () => _bluetoothBloc.add(SearchDevices()),
                        child: Container(
                          width: responsive.wp(30),
                          height: responsive.hp(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(15, 148, 134, 0.7),
                              borderRadius: BorderRadius.circular(responsive.wp(10)),
                          ),
                          
                          child: Text(
                            "Conectar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: responsive.wp(4)),
                          ),
                        ),
                      );
                    }
                  })
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
