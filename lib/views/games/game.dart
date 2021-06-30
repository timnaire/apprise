import 'package:flutter/material.dart';
import 'package:apprise/theme/icons/apprise_icons.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class GameScreenWidget extends StatefulWidget {
  const GameScreenWidget({Key? key}) : super(key: key);

  @override
  _GameScreenWidgetState createState() => _GameScreenWidgetState();
}

class _GameScreenWidgetState extends State<GameScreenWidget> {
  final _games = [];

  @override
  Widget build(BuildContext context) {
    Widget _sampleList = Card(
      color: Theme.of(context).colorScheme.background,
      elevation: 0.0,
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('Game Title News Here'),
            subtitle: Text('Game details description in here'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Preview Game Title Here'),
                      content: const Text('Preview game details here'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.secondary),
                          ),
                        )
                      ],
                    ),
                    barrierDismissible: false,
                  );
                },
                child: const Text('Preview'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Read More'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Game News'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Apprise.pc)),
              Tab(icon: Icon(Apprise.nintendo)),
              Tab(icon: Icon(Apprise.playstation)),
              Tab(icon: Icon(Apprise.xbox)),
            ],
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  print('Search Button');
                },
                icon: Icon(Icons.search, semanticLabel: 'search')),
            IconButton(
                onPressed: () {
                  print('Refresh');
                },
                icon: Icon(Icons.refresh, semanticLabel: 'refresh'))
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
              child: ListView(
                children: [
                  _sampleList,
                  Divider(),
                  _sampleList,
                  Divider(),
                  TextButton(
                    onPressed: () async {
                      await _showNotification();
                    },
                    child: const Text('Show Notification Sample'),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _showNotification();
                    },
                    child: Text('Elevated Button'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.secondary)),
                  ),
                  Divider(),
                  _sampleList,
                  Divider(),
                  _sampleList,
                  Divider(),
                  _sampleList,
                  Divider(),
                  _sampleList,
                  Divider(),
                  _sampleList,
                  Divider(),
                  _sampleList,
                  Divider(),
                  _sampleList,
                ],
              ),
            ),
            Center(
              child: Text("Nintendo Games here"),
            ),
            Center(
              child: Text("PlayStation Games here"),
            ),
            Center(
              child: Text("XBOX Games here"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'your channel id', 'your channel name', 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, 'PC Games',
        'A new game has been announced !!!', platformChannelSpecifics,
        payload: 'item x');
  }
}
