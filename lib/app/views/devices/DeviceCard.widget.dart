import 'package:flutter/material.dart';
import 'package:tpf_mobile/app/models/device.model.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({Key? key, required this.device}) : super(key: key);

  final Device device;

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? const Color.fromRGBO(246, 246, 246, 1.0)
            : const Color.fromARGB(255, 0, 0, 0);
    final Color cardBackgroundColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? const Color.fromRGBO(18, 18, 18, 1.0)
            : const Color.fromRGBO(246, 246, 246, 1.0);

    return Container(
      margin: const EdgeInsets.all(20),
      child: Material(
        color: cardBackgroundColor,
        elevation: 5,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          margin: const EdgeInsets.all(15),
          color: cardBackgroundColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 0, top: 0),
                    child: Text(
                      "Dispositivo: ${device.name}",
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      "Localização: ${device.latitude}, ${device.longitude}",
                      style: TextStyle(fontSize: 12, color: textColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
