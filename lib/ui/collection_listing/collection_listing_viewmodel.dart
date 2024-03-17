import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/gallery.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';

class CollectionListingViewModel extends FutureViewModel<GalleryModel> {
  final _userService = locator<UserService>();

  GalleryModel? galleryItems;
  final GalleryModel galleryImage;
  final String? title;

  CollectionListingViewModel(this.galleryImage, this.title);
  openPhoto(String photos, String photoTitle) {
    // _navService.navigateTo(Routes.photoDetailView,
    //     arguments: PhotoDetailViewArguments(photoTitle, photo: photos));
  }

  @override
  void onData(GalleryModel? data) {
    super.onData(data);
    if (data != null) {
      galleryItems = data;
    }
  }

  @override
  Future<GalleryModel> futureToRun() {
    return _userService.getCollectionListning(galleryImage);
  }
}
