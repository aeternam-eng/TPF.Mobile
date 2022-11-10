import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tpf_mobile/app/repositories/device.repository.dart';
import 'package:tpf_mobile/app/repositories/measurement.repository.dart';

final measurementRepositoryProvider =
    Provider((ref) => MeasurementRepository(ref.read));

final deviceRepositoryProvider = Provider((ref) => DeviceRepository(ref.read));
