import 'dart:collection';

import 'package:flutter/material.dart';

abstract class News extends ChangeNotifier {
  final Image? img;
  final String title;
  final String description;
  final List<News> _items = [];
  UnmodifiableListView<News> get items => UnmodifiableListView(_items);

  News(this.img, this.title, this.description);

  void add(News item) {
    _items.add(item);
    notifyListeners();
  }
}
