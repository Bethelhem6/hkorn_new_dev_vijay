import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/course_detail_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';

class CourseDetailViewModel extends FutureViewModel {
  final _userService = locator<UserService>();
  final String courseId;

  CourseDetailViewModel(this.courseId);

  CourseDetailModel? courseDetailModel;

  @override
  void onData(data) {
    super.onData(data);
    courseDetailModel = data;
  }

  @override
  Future futureToRun() {
    Map<String, dynamic> data = {'course_id': courseId};
    return _userService.getCourseDetail(data);
  }
}
