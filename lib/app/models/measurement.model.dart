import 'package:tpf_mobile/app/models/device.model.dart';

class Measurement {
  String id;
  Device device;
  double probability;
  bool isFogoBicho;
  DateTime date;
  String? imageUrl;

  Measurement(
      {required this.id,
      required this.device,
      required this.probability,
      required this.isFogoBicho,
      required this.date,
      required this.imageUrl});

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
      id: json['id'],
      device: Device.fromJson(json['device']),
      probability: json['image_Fire_Probability'],
      date: DateTime.parse(json['date']),
      isFogoBicho: json['is_fogo_bicho'],
      imageUrl: json['imageUrl']);
}
