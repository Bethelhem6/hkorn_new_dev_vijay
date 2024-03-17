// ignore_for_file: avoid_function_literals_in_foreach_calls, implementation_imports

import 'package:dio/src/multipart_file.dart' as multipart;
import 'package:hkorn_new_dev_vijay/model/group_album.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/service/shared_pref_service.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:hkorn_new_dev_vijay/util/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class GroupAlbumViewModel extends FutureViewModel<List<GroupAlbumModel>?> {
  final int groupId;
  final ImagePicker _picker = ImagePicker();
  List<dynamic> albumPhotoList = [];
  final _userService = locator<UserService>();
  final navService = locator<NavigationService>();
  final _sharedService = locator<SharedPrefService>();
  List<GroupAlbumModel> groupAlbumPhoto = [];
  GroupAlbumViewModel(this.groupId);

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
  void onData(List<GroupAlbumModel>? data) {
    super.onData(data);
    if (data != null) {
      groupAlbumPhoto.addAll(data);
    }
  }

  @override
  Future<List<GroupAlbumModel>?> futureToRun() {
    return _userService.getGroupAlbum(groupId);
  }
}
