import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tpf_mobile/app/models/device.model.dart';
import 'package:tpf_mobile/app/providers/providers.dart';
import 'package:tpf_mobile/app/views/devices/DeviceCard.widget.dart';

class Devices extends ConsumerStatefulWidget {
  const Devices({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Devices();
}

class _Devices extends ConsumerState<Devices> {
  _fetchDevices() {
    final userData = ref.read(authProvider);
    return ref.read(deviceProvider.notifier).getDevices(userData.value!.userId);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchDevices());
  }

  @override
  Widget build(BuildContext context) {
    final devicesList = ref.watch(deviceProvider);

    ref.listen<AsyncValue<List<Device>?>>(deviceProvider, (_, state) => {});

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: devicesList.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: devicesList.value?.length,
                    itemBuilder: (context, index) => DeviceCard(
                      device: devicesList.value![index],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
