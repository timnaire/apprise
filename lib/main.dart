import 'package:flutter/material.dart';

import 'package:apprise/views/home/home.dart';
import 'package:apprise/views/utils/loading.dart';
import 'package:apprise/theme/theme.dart';

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:rxdart/subjects.dart';

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String?> selectNotificationSubject =
    BehaviorSubject<String?>();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

String? selectedNotificationPayload;

Future<void> main() async {
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();

  // String initialRoute = HomePage.routeName;
  // if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
  //   selectedNotificationPayload = notificationAppLaunchDetails!.payload;
  //   initialRoute = SecondPage.routeName;
  // }

  runApp(Apprise());
}

class Apprise extends StatefulWidget {
  const Apprise({Key? key}) : super(key: key);

  @override
  _AppriseState createState() => _AppriseState();
}

class _AppriseState extends State<Apprise> {
  @override
  void initState() {
    super.initState();
    _configureSelectNotificationSubject();
    customTheme.addListener(() {
      setState(() {});
    });
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String? payload) async {
      await Navigator.pushNamed(context, '/secondPage');
    });
  }

  @override
  void dispose() {
    didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Apprise',
        // home: HomePage(),
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: customTheme.currentTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Loading(),
          '/home': (context) => HomePage(),
        });
  }
}
