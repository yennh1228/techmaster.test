import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'notification.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  final String response = await rootBundle.loadString('assets/json/noti.json');
  final NotificationResponse notificationResponse =
      NotificationResponse.fromRawJson(response);

  notificationResponse.data?.forEach((element) {
    debugPrint("${element.toJson()}");
    debugPrint("____________________");
  });
}
