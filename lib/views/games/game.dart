import 'package:flutter/material.dart';
import 'package:apprise/theme/icons/apprise_icons.dart';

class GameScreenWidget extends StatefulWidget {
  const GameScreenWidget({Key? key}) : super(key: key);

  @override
  _GameScreenWidgetState createState() => _GameScreenWidgetState();
}

class _GameScreenWidgetState extends State<GameScreenWidget> {
  final _games = [];

  @override
  Widget build(BuildContext context) {
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
            ListView(
              children: [],
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
}
