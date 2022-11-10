import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tpf_mobile/app/providers/repository_providers.dart';
import 'package:tpf_mobile/app/models/measurement.model.dart';

class MeasurementNotifier
    extends StateNotifier<AsyncValue<List<Measurement>?>> {
  final Reader reader;

  MeasurementNotifier(this.reader) : super(AsyncValue.data(List.empty()));

  Future<void> getMeasurement(String userId) async {
    try {
      state = const AsyncValue.loading();
      state = AsyncValue.data(await reader(measurementRepositoryProvider)
          .getUserMeasurements(userId));
    } catch (e) {
      state = AsyncValue.error(e.toString());
    }
  }
}
