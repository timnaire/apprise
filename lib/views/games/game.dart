import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:apprise/theme/icons/apprise_icons.dart';
// import 'package:provider/provider.dart';
import 'package:universal_feed/universal_feed.dart' as universal_feed;
import '../models/news.dart';
import 'models/index.dart';

class GameScreenWidget extends StatefulWidget {
  const GameScreenWidget({Key? key}) : super(key: key);

  @override
  _GameScreenWidgetState createState() => _GameScreenWidgetState();
}

class _GameScreenWidgetState extends State<GameScreenWidget> {
  late List<PcNews> _pcNews =  [];

  // [
  //   new PcNews('Test 1', 'Description 2'),
  //   new PcNews('Test 2', 'Description 2'),
  //   new PcNews('Test 3', 'Description 3'),
  //   new PcNews('Test 4', 'Description 4'),
  //   new PcNews('Test 5', 'Description 5'),
  //   new PcNews('Test 6', 'Description 6'),
  //   new PcNews('Test 7', 'Description 7')
  // ];
  late List<PsNews> _psNews = [];
  late List<XboxNews> _xboxNews = [];
  late List<NintendoNews> _nintendoNews = [];

  Widget getPcGameNews() {
    if (_pcNews.isEmpty) {
      return Center(
        child: Text('No games news.'),
      );
    }

    return ListView(
      children: [
        for (var news in _pcNews) new NewsCard(news: news),
      ],
    );
  }

  Widget getPsGameNews() {
    if (_psNews.isEmpty) {
      return Center(
        child: Text('No playstation news.'),
      );
    }

    return ListView(
      children: [
        for (var news in _psNews) new NewsCard(news: news),
      ],
    );
  }

  Widget getXboxGameNews() {
    if (_xboxNews.isEmpty) {
      return Center(
        child: Text('No xbox news.'),
      );
    }

    return ListView(
      children: [
        for (var news in _xboxNews) new NewsCard(news: news),
      ],
    );
  }

  Widget getNintendoGameNews() {
    if (_nintendoNews.isEmpty) {
      return Center(
        child: Text('No nintendo news.'),
      );
    }

    return ListView(
      children: [
        for (var news in _nintendoNews) new NewsCard(news: news),
      ],
    );
  }

  final feeds = [
    'https://www.gematsu.com/feed',
  ];
  
  void getItems() async {
    for (final feed in feeds) {
      final feedContent = await readUrl(feed);
      final uf = universal_feed.UniversalFeed.parseFromString(feedContent);
      _pcNews = showContent(uf);
      // print(
      //     '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
    }
  }

  @override
  Widget build(BuildContext context) {
    getItems();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Game News'),
          bottom: TabBar(
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
              margin: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
              child: getPcGameNews()
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
              child: getPsGameNews()
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
              child: getXboxGameNews()
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
              child: getNintendoGameNews()
            ),
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    // log('data: $news');
    Widget card = Card(
      color: Theme.of(context).colorScheme.background,
      elevation: 0.0,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: news.img ?? Icon(Icons.mouse_outlined),
            title: Text(news.title),
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
                      title: Text('Preview Game Title Here'),
                      content: Text('Preview game details here'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
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
                child: Text('Preview'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Read More'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );

    return card;
  }
}

List<PcNews> showContent(universal_feed.UniversalFeed feed) {
  List<PcNews> news = [];
  // logData('feed kind: ', feed.meta.kind.toString());
  // logData('feed extensions: ', feed.meta.extensions.toString());
  // logData('feed version: ', feed.meta.version);
  // logData('...<', ' ');
  // logData('feed title: ', feed.title ?? '');
  // logData('feed description: ', feed.description ?? '');
  // logData('site link: ', feed.htmlLink?.href ?? '');
  // logData('feed link: ', feed.xmlLink?.href ?? '');
  // logData('feed published: ', join([feed.published?.value, feed.published?.parseValue()?.toIso8601String()]));
  // logData('feed updated: ', join([feed.updated?.value, feed.updated?.parseValue()?.toIso8601String()]));
  // logData('...<', ' ');
  final itemsLength = min(feed.items.length, 5);
  for (var i = 0; i < itemsLength; i++) {
    final item = feed.items[i];
    news.add(new PcNews(
        Image.network(
            'https://pbs.twimg.com/profile_images/1625204439572221975/w_BeA08U_400x400.jpg'),
        item.title ?? '',
        item.description ?? ''));
    logData('item title: ', item.title ?? '');
    logData('item description: ', item.description ?? '');
    logData('item link: ', item.links.first.href);
    logData('item published: ', join([item.published?.value, item.published?.parseValue()?.toIso8601String()]));
    logData('item updated: ', join([item.updated?.value, item.updated?.parseValue()?.toIso8601String()]));
    // print('>-----');
  }

  return news;
}

String join(List<String?> values) {
  values.removeWhere((element) => element == null || element.isEmpty);
  return values.join(' / ');
}

void logData(String label, String data) {
  if (data.isNotEmpty) print('$label $data');
}

// function to read a file from internet
Future<String> readUrl(String url) async {
  final httpClient = HttpClient();
  final request = await httpClient.getUrl(Uri.parse(url));
  final response = await request.close();
  final contents = await response.transform<String>(utf8.decoder).join();
  return contents;
}
