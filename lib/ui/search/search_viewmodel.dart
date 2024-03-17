import 'package:flutter/cupertino.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/search_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';

class SearchViewModel extends BaseViewModel {
  final _userService = locator<UserService>();
  final TextEditingController searchController = TextEditingController();
  List<SearchResultModel>? result = [];

  List recentSearchItems = [];

  SearchViewModel() {
    setupRecentSearch();
  }

  void setupRecentSearch() async {
    Map? data = await _userService.getRecentSearch();
    if (data != null && data['data'] != null) {
      if (data['data'] != "No keyword found!") {
        List items = data['data'];
        for (var element in items) {
          recentSearchItems.add(element['keyword']);
        }
      }
    }
    notifyListeners();
  }

  void search() async {
    if (searchController.text.isEmpty) {
      return;
    }

    setBusy(true);
    result = await _userService.getSearchResult(searchController.text.trim());
    addToRecentSearch();
    setBusy(false);

    notifyListeners();
  }

  void addToRecentSearch() {
    _userService.addToRecentSearch(searchController.text.trim());
    recentSearchItems.add(searchController.text.trim());
    notifyListeners();
  }

  void clearRecentSearch() {
    recentSearchItems.clear();
    result?.clear();
    notifyListeners();
  }
}
