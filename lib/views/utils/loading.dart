import 'package:flutter/material.dart';
import 'package:apprise/theme/theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // temporary set current theme
  void _setupCurrentTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final isDarkTheme = prefs.getBool('isDarkTheme') ?? false;

    setState(() {
      customTheme.setDarkTheme = isDarkTheme;
    });
    Navigator.restorablePushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    _setupCurrentTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
