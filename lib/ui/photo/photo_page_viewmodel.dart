import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/model/photo_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PhotoPageViewModel extends FutureViewModel<List<PhotoModel>?> {
  final _userService = locator<UserService>();
  final _navService = locator<NavigationService>();
  int currentIndex = 0;

  List<PhotoModel> photoList = [];

  openPhotoDetail(int photoId) {
    _navService.navigateTo(Routes.photoDetailView,
        arguments: PhotoDetailViewArguments('', photo: []));
  }

  void onTap(int index) async {
    currentIndex = index;
    notifyListeners();
  }

  @override
  void onData(List<PhotoModel>? data) {
    super.onData(data);
    if (data != null) {
      photoList.addAll(data);
    }
  }

  @override
  Future<List<PhotoModel>?> futureToRun() {
    return _userService.getPhotoDetail();
  }
}
