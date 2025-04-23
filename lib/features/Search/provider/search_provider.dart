import 'package:flutter/material.dart';
import 'package:y2y/features/Search/models/search_model.dart';


class SearchProvider extends ChangeNotifier {
  List<SearchModel> _searchResults = [];

  List<SearchModel> get searchItemss => _searchResults;

  void searchItems(String query) {
    if (_allItems.isEmpty) return;

    if (query.isEmpty) {
      _searchResults = [];
    } else {
      _searchResults = _allItems
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  List<SearchModel> _allItems = [];

  void setAllItems(List<SearchModel> items) {
    _allItems = items;
    notifyListeners();
  }
}
