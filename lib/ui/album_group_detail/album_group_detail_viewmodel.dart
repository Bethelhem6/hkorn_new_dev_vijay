// ignore_for_file: avoid_function_literals_in_foreach_calls, implementation_imports

import 'package:dio/src/multipart_file.dart' as multipart;
import 'package:hkorn_new_dev_vijay/model/group_album_photo_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/service/shared_pref_service.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:hkorn_new_dev_vijay/util/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class GroupAlbumDetailViewModel
    extends FutureViewModel<List<GroupPhotoAlbumModel>?> {
  final int groupId;
  final String albumId;
  final ImagePicker _picker = ImagePicker();
  List<dynamic> albumPhotoList = [];
  final _userService = locator<UserService>();
  final _sharedService = locator<SharedPrefService>();
  final navService = locator<NavigationService>();
  List<GroupPhotoAlbumModel> groupAlbumPhoto = [];
  GroupAlbumDetailViewModel(this.albumId, this.groupId);

  Future<void> getImageFromGallery() async {
    final List<XFile>? image = await _picker.pickMultiImage();
    albumPhotoList.clear();
    logger.d(image?.first.path);
    if (image != null) {
      image.forEach((element) async {
        albumPhotoList.add(await multipart.MultipartFile.fromFile(element.path,
            filename: element.name));
      });
      Future.delayed(const Duration(seconds: 2)).then((value) async {
        logger.d(albumPhotoList.length);
        if (albumPhotoList.isNotEmpty) {
          Map storedData = await _sharedService.getStoredData();
          Map<String, dynamic> model = {
            "user_id": storedData['id'],
            "title": "images",
            "photos[]": albumPhotoList,
            "group_id": groupId
          };
          _userService.setAlbumtoServer(model);
        }
      });
    }
  }

  @override
  void onData(List<GroupPhotoAlbumModel>? data) {
    super.onData(data);
    if (data != null) {
      groupAlbumPhoto.addAll(data);
    }
  }

  @override
  Future<List<GroupPhotoAlbumModel>?> futureToRun() {
    return _userService.getGroupAlbumPhoto(albumId);
  }
}
