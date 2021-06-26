import 'package:flutter/material.dart';
import 'package:apprise/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  void _toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      customTheme.toggleTheme();
      prefs.setBool('isDarkTheme', customTheme.isDartTheme);
      print(prefs.getBool('isDarkTheme'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          toolbarHeight: 150.0,
          title: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('More')],
              ),
              SizedBox(height: 70.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [Text('Apprise')],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: customTheme.isDartTheme
                ? Icon(Icons.toggle_on)
                : Icon(Icons.toggle_off),
            title: Text('Dark Theme'),
            onTap: () {
              _toggleTheme();
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text('Settings screen is under going development.')));
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('About'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('About screen is under going development.')));
            },
          ),
        ],
      ),
    );
  }
}

// Widget _buildWidget() {
//   // const defaultAnimeTabBarHeight = 47.5;

//   return Builder(builder: (BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(150.0),
//         child: AppBar(
//           toolbarHeight: 150.0,
//           title: Column(
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [Text('More')],
//               ),
//               SizedBox(height: 70.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [Text('Apprise')],
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           ListTile(
//             leading: customTheme.isDartTheme
//                 ? Icon(Icons.toggle_on)
//                 : Icon(Icons.toggle_off),
//             title: Text('Dark Theme'),
//             onTap: () {
//               customTheme.toggleTheme();
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text('Settings'),
//             onTap: () {
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content:
//                       Text('Settings screen is under going development.')));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.help_outline),
//             title: Text('About'),
//             onTap: () {
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text('About screen is under going development.')));
//             },
//           ),
//         ],
//       ),
//     );
//   });
// }
