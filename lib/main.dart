import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'notification.dart';
import 'notificationPage.dart';

late final NotificationResponse notificationResponse;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  final String responseStr =
      await rootBundle.loadString('assets/json/noti.json');
  notificationResponse = NotificationResponse.fromRawJson(responseStr);

  notificationResponse.data?.forEach((element) {
    debugPrint("${element.toJson()}");
    debugPrint("____________________");
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotificationPage(),
    );
  }
}
