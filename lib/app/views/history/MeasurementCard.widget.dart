import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tpf_mobile/app/models/measurement.model.dart';
import 'package:tpf_mobile/shared/helpers/maps_helper.dart';

class MeasurementCard extends StatelessWidget {
  const MeasurementCard({Key? key, required this.measurement})
      : super(key: key);

  final Measurement measurement;

  @override
  Widget build(BuildContext context) {
    _openGoogleMapsOnMeasurement() {
      MapsHelper.of(context)
          .openMap(measurement.device.latitude, measurement.device.longitude);
    }

    _showImage() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Image.network(
            measurement.imageUrl!,
            alignment: Alignment.center,
            fit: BoxFit.contain,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      );
    }

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
                      "Dispositivo: " + measurement.device.name,
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      "Data: " +
                          DateFormat('dd/MM/yyyy HH:mm', 'pt_BR')
                              .format(measurement.date.toLocal()),
                      style: TextStyle(fontSize: 12, color: textColor),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      "Probabilidade de incêndio: " +
                          (measurement.probability * 100).toStringAsFixed(2) +
                          "%",
                      style: TextStyle(fontSize: 12, color: textColor),
                    ),
                  ),
                ],
              ),
              measurement.imageUrl != null
                  ? IconButton(
                      onPressed: _showImage,
                      icon: const Icon(
                        FontAwesomeIcons.image,
                        size: 30,
                        color: Color.fromRGBO(228, 37, 44, 1.0),
                      ),
                    )
                  : const SizedBox.shrink(),
              IconButton(
                onPressed: _openGoogleMapsOnMeasurement,
                icon: const Icon(
                  FontAwesomeIcons.locationPin,
                  size: 30,
                  color: Color.fromRGBO(228, 37, 44, 1.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
