import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tpf_mobile/app/models/device.model.dart';
import 'package:tpf_mobile/app/repositories/base_repository.dart';

class DeviceRepository extends ProviderRepositoryBase {
  DeviceRepository(Reader reader) : super(reader);

  Future<List<Device>> getDevices(String userId) async {
    var response =
        await dio.get<List<dynamic>>('/api/v1/users/$userId/devices');

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data!.map((element) => Device.fromJson(element)).toList();
    }

    throw Exception('Falha ao buscar dispositivos - ${response.statusCode}');
  }
}
