import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tpf_mobile/app/models/device.model.dart';
import 'package:tpf_mobile/app/providers/repository_providers.dart';

class DeviceNotifier extends StateNotifier<AsyncValue<List<Device>?>> {
  final Reader reader;

  DeviceNotifier(this.reader) : super(AsyncValue.data(List.empty()));

  Future<void> getDevices(String userId) async {
    try {
      state = const AsyncValue.loading();
      state = AsyncValue.data(
          await reader(deviceRepositoryProvider).getDevices(userId));
    } catch (e) {
      state = AsyncValue.error(e.toString());
    }
  }
}
