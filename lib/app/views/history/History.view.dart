import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tpf_mobile/app/providers/providers.dart';
import 'package:tpf_mobile/app/views/history/MeasurementCard.widget.dart';
import 'package:tpf_mobile/shared/extensions/async_value_extensions.dart';
import 'package:tpf_mobile/app/models/measurement.model.dart';

class History extends ConsumerStatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _History();
}

class _History extends ConsumerState<History> {
  _fetchHistory() {
    final userData = ref.read(authProvider);
    return ref
        .read(measurementProvider.notifier)
        .getMeasurement(userData.value!.userId);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchHistory());
  }

  @override
  Widget build(BuildContext context) {
    final measurementsList = ref.watch(measurementProvider);

    _verifyFireAlert() {
      // If the date was at most an hour ago
      var referenceDate = DateTime.now().toUtc().add(const Duration(hours: -1));
      var list = measurementsList.value ?? List.empty();

      return list.any((measurement) =>
          (measurement.date.toUtc().compareTo(referenceDate) > 0));
    }

    final bool shouldShowFireAlert = _verifyFireAlert();

    ref.listen<AsyncValue<List<Measurement>?>>(measurementProvider,
        (previous, next) => next.showSnackBarOnError(context));

    final Color textColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? const Color.fromRGBO(246, 246, 246, 1.0)
            : const Color.fromARGB(255, 0, 0, 0);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Material(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? const Color.fromRGBO(35, 35, 35, 1.0)
                      : Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: shouldShowFireAlert
                            ? const Color.fromRGBO(180, 26, 0, 1.0)
                            : const Color.fromRGBO(65, 161, 69, 1.0),
                        child: shouldShowFireAlert
                            ? const Icon(
                                FontAwesomeIcons.x,
                                color: Colors.white,
                                size: 32,
                              )
                            : const Icon(
                                FontAwesomeIcons.check,
                                color: Colors.white,
                                size: 32,
                              ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 16)),
                    Expanded(
                      child: Text(
                        shouldShowFireAlert
                            ? "Aviso! Um possível incêndio foi detectado dentro da última hora. Verifique abaixo:"
                            : "Nenhum possível incêndio detectado hoje. :-)",
                        style: TextStyle(fontSize: 16, color: textColor),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              child: measurementsList.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: measurementsList.value?.length,
                      itemBuilder: (context, index) => MeasurementCard(
                        measurement: measurementsList.value![index],
                      ),
                    ),
              onRefresh: () async {
                _fetchHistory();
              },
            ),
          ),
        ],
      ),
    );
  }
}
