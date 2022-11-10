import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tpf_mobile/app/models/measurement.model.dart';

import '../repositories/base_repository.dart';

class MeasurementRepository extends ProviderRepositoryBase {
  MeasurementRepository(Reader reader) : super(reader);

  Future<List<Measurement>> getUserMeasurements(String userId) async {
    var response = await dio.get<List<dynamic>>('/api/v1/users/$userId/fires');

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data!
          .map((element) => Measurement.fromJson(element))
          .toList();
    }

    throw Exception('Falha ao listar historico - ${response.statusCode}');
  }
}
