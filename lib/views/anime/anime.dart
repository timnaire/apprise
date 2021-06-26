import 'package:flutter/material.dart';

class AnimeScreenWidget extends StatefulWidget {
  const AnimeScreenWidget({Key? key}) : super(key: key);

  @override
  _AnimeScreenWidgetState createState() => _AnimeScreenWidgetState();
}

class _AnimeScreenWidgetState extends State<AnimeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Anime News'),
          bottom: const TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Tab(
                text: 'Following',
              ),
              Tab(
                text: 'Sub',
              ),
              Tab(
                text: 'Dub',
              ),
              Tab(
                text: 'News',
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  print('Search Button');
                },
                icon: Icon(
                  Icons.search,
                  semanticLabel: 'search',
                )),
            IconButton(
                onPressed: () {
                  print('Refresh');
                },
                icon: Icon(
                  Icons.refresh,
                  semanticLabel: 'refresh',
                ))
          ],
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("Followed animes shows here"),
            ),
            Center(
              child: Text("New sub anime shows here"),
            ),
            Center(
              child: Text("New dub anime shows here"),
            ),
            Center(
              child: Text("Animw news shows here"),
            ),
          ],
        ),
      ),
    );
  }
}
