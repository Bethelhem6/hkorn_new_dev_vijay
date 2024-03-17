import 'package:carousel_slider/carousel_slider.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';

class PhotoDetailPageViewModel extends FutureViewModel<List<String>> {
  final _userService = locator<UserService>();
  final List<String> photo;
  final String photoTitle;
  CarouselController carouselController = CarouselController();

  String? photoUrl;
  String? title;

  PhotoDetailPageViewModel(this.photo, this.photoTitle);

  @override
  void onData(data) {
    super.onData(data);
  }

  @override
  Future<List<String>> futureToRun() {
    return _userService.getCollectionDetailPage(photo);
  }
}
