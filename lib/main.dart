import 'package:flutter/material.dart';

import 'package:apprise/views/home/home.dart';
import 'package:apprise/views/utils/loading.dart';
import 'package:apprise/theme/theme.dart';

void main() {
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
    customTheme.addListener(() {
      setState(() {});
    });
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
