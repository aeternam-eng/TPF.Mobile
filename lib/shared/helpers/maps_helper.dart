import 'package:flutter/cupertino.dart';
import 'package:tpf_mobile/shared/helpers/snack_bar_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsHelper {
  final BuildContext context;

  MapsHelper.of(this.context);

  Future<void> openMap(double latitude, double longitude) async {
    Uri googleUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      showErrorSnackBar(context, 'Um erro ocorreu ao tentar abrir o mapa');
    }
  }
}
