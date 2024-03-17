// ignore_for_file: implementation_imports

import 'dart:io';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/group_photo_model.dart';
import 'package:hkorn_new_dev_vijay/service/shared_pref_service.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:hkorn_new_dev_vijay/util/logger.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:dio/src/multipart_file.dart' as multipart;

class GroupPhotoViewModel extends FutureViewModel<List<GroupPhotoModel>?> {
  final int groupId;
  final ImagePicker _picker = ImagePicker();
  File? photo;
  final _userService = locator<UserService>();
  final _sharedService = locator<SharedPrefService>();
  List<GroupPhotoModel> groupPhoto = [];

  GroupPhotoViewModel(this.groupId);

  Future<void> getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      photo = File(image.path);
      logger.d(photo);
      Map storedData = await _sharedService.getStoredData();
      String fileName = image.path.split('/').last;

      Map<String, dynamic> model = {
        "user_id": storedData['id'],
        "title": "my photo",
        "photo": await multipart.MultipartFile.fromFile(image.path,
            filename: fileName),
        "group_id": groupId
      };
      _userService.setImagetoServer(model);
    }
  }

  @override
  void onData(List<GroupPhotoModel>? data) {
    super.onData(data);
    if (data != null) {
      groupPhoto.addAll(data);
    }
  }

  @override
  Future<List<GroupPhotoModel>?> futureToRun() {
    return _userService.getGroupPhoto();
  }
}
