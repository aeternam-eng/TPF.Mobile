import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tpf_mobile/app/models/device.model.dart';
import 'package:tpf_mobile/app/models/measurement.model.dart';
import 'package:tpf_mobile/app/notifiers/device.notifier.dart';
import 'package:tpf_mobile/app/notifiers/measurement.notifier.dart';
import '../models/auth_response.model.dart';
import '../notifiers/auth.notifier.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<AuthResponse?>>(
        (ref) => AuthNotifier());

final measurementProvider =
    StateNotifierProvider<MeasurementNotifier, AsyncValue<List<Measurement>?>>(
        (ref) => MeasurementNotifier(ref.read));

final deviceProvider =
    StateNotifierProvider<DeviceNotifier, AsyncValue<List<Device>?>>(
        (ref) => DeviceNotifier(ref.read));
