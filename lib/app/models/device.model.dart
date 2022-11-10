class Device {
  final String id;
  final String userId;
  final double latitude;
  final double longitude;
  final String name;

  Device(
      {required this.id,
      required this.userId,
      required this.latitude,
      required this.longitude,
      required this.name});

  factory Device.fromJson(Map<String, dynamic> json) => Device(
      id: json['id'],
      userId: json['user_Id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      name: json['name']);
}
