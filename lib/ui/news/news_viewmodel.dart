import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/model/news_list.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewsViewModel extends FutureViewModel<List<NewsModel>?> {
  final _navService = locator<NavigationService>();
  final _userService = locator<UserService>();

  List<NewsModel> newsList = [];

  openNews(int newsId) {
    _navService.navigateTo(Routes.newsDetailView,
        arguments: NewsDetailViewArguments(newsId: newsId));
  }

  @override
  void onData(List<NewsModel>? data) {
    super.onData(data);
    if (data != null) {
      newsList.addAll(data);
    }
  }

  @override
  Future<List<NewsModel>?> futureToRun() {
    return _userService.getNews();
  }
}
