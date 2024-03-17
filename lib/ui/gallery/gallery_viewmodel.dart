import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/model/gallery.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GalleryViewModel extends FutureViewModel<List<GalleryModel>?> {
  final _navService = locator<NavigationService>();
  final _userService = locator<UserService>();

  List<GalleryModel> galleryItems = [];

  openPhoto(GalleryModel galleryList, String title, List<String> photoImage) {
    _navService.navigateTo(Routes.photoDetailView,
        arguments: PhotoDetailViewArguments(title, photo: photoImage));
  }

  @override
  void onData(List<GalleryModel>? data) {
    super.onData(data);
    if (data != null) {
      galleryItems.addAll(data);
    }
    print('Lenth==${galleryItems.length}');
  }

  @override
  Future<List<GalleryModel>?> futureToRun() {
    return _userService.getGallery();
  }
}
