import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/event_detail_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:hkorn_new_dev_vijay/util/logger.dart';
import 'package:stacked/stacked.dart';

class EventDetailViewModel extends FutureViewModel<EventDetailModel> {
  final _userService = locator<UserService>();
  final int eventId;
  String pdfUrl = '';
  String? htmlData;

  EventDetailViewModel(this.eventId);

  EventDetailModel? eventDetailModel;

  @override
  void onData(data) {
    super.onData(data);
    if (data != null) {
      eventDetailModel = data;
      if (eventDetailModel?.description?.contains('pdf') ?? false) {
        pdfUrl = eventDetailModel?.description
                ?.split('embeddoc url')[1]
                .split('viewer')
                .first ??
            '';
        print('Url===${pdfUrl}');
      }
      if (eventDetailModel?.description?.contains('embeddoc url') ?? false) {
        htmlData = eventDetailModel?.description
            ?.split('viewer=\"google')
            .last
            .substring(2);
        logger.d(htmlData);
      } else {
        htmlData = eventDetailModel?.description;
        logger.d(htmlData);
      }

      // setUpEvents(data);
    }
  }

  @override
  Future<EventDetailModel> futureToRun() {
    Map<String, dynamic> data = {"event_id": eventId};
    return _userService.getEventDetail(data);
  }
}
