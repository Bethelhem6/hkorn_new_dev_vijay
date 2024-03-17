import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/news_detail.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';

class NewsDetailViewModel extends FutureViewModel {
  final int newsId;
  final _userService = locator<UserService>();

  NewsDetailViewModel(this.newsId);

  NewsDetailModel? newsModel;

  List<String> url = [
    "https://media.istockphoto.com/photos/smiling-medical-team-standing-together-outside-a-hospital-picture-id998313080?k=20&m=998313080&s=612x612&w=0&h=ZnM0_9x63aPOfV4-hmn3QxazCDJpUXymwAEN-Jr5aMo=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdvyO5mMxbf-VdzP1hdvd3lGlUkHozoGHhbg&usqp=CAU",
    'https://media.istockphoto.com/photos/doctor-and-nurses-wheeling-patient-in-gurney-down-hospital-corridor-picture-id151811860?k=20&m=151811860&s=612x612&w=0&h=MFHUyNvdQCIq1-y6JAMLdoXSwde-3WXgztmKdWKFtwo=',
    'https://www.aljazeera.com/wp-content/uploads/2022/02/2022-02-17T044853Z_1420532790_RC2FLS9SKGDY_RTRMADP_3_HEALTH-CORONAVIRUS-HONGKONG.jpg?resize=1200%2C630',
    "https://media.istockphoto.com/photos/smiling-medical-team-standing-together-outside-a-hospital-picture-id998313080?k=20&m=998313080&s=612x612&w=0&h=ZnM0_9x63aPOfV4-hmn3QxazCDJpUXymwAEN-Jr5aMo=",
    'https://s.abcnews.com/images/International/india-young-doc-wider-image-00-rt-jef-210505_1620231824281_hpMain_16x9_1600.jpg',
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdvyO5mMxbf-VdzP1hdvd3lGlUkHozoGHhbg&usqp=CAU",
    "https://media.istockphoto.com/photos/smiling-medical-team-standing-together-outside-a-hospital-picture-id998313080?k=20&m=998313080&s=612x612&w=0&h=ZnM0_9x63aPOfV4-hmn3QxazCDJpUXymwAEN-Jr5aMo=",
    'https://s.abcnews.com/images/International/india-young-doc-wider-image-00-rt-jef-210505_1620231824281_hpMain_16x9_1600.jpg',
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdvyO5mMxbf-VdzP1hdvd3lGlUkHozoGHhbg&usqp=CAU",
  ];

  @override
  void onData(data) {
    super.onData(data);
    newsModel = data;
  }

  @override
  Future futureToRun() {
    Map<String, dynamic> data = {'news_id': newsId};
    return _userService.getNewsDetailDetail(data);
  }
}
