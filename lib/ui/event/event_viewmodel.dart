import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/model/event_list_mode.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:hkorn_new_dev_vijay/util/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EventViewModel extends FutureViewModel<List<EventDataModel>?> {
  final _navService = locator<NavigationService>();
  final _userService = locator<UserService>();
  DatePickerController datePickController = DatePickerController();

  DateTime selectedDate = DateTime.now();

  // {
  // "event_id": 2682,
  // "event_title": "HKORN NEW MEMBERSHIP",
  // "event_description": "<h3>Application for New Membership (April 2021- March 2022)</h3>\r\n<h3>New Membership Fee $200 ($100 Sign up Fee + $100 One-year membership Fee)</h3>\r\n<h3>Payment method:</h3>\r\n<ol>\r\n \t<li> FPS 付款 (FPS: 164037426)</li>\r\n</ol>\r\nCash payment is not accepted.",
  // "image": "https://hkornrenew.mockup-design.com/wp-content/uploads/2021/03/HKORN_MEMBERSHIP_Subscription_smallwhitebg.png",
  // "price": "HK$200",
  // "date": "2021-03-25 20:54:09"
  // },

  List elements = [];

  void goToDetail(int eventID) {
    _navService.navigateTo(Routes.eventDetailView,
        arguments: EventDetailViewArguments(eventID: eventID));
  }

  @override
  void onData(data) {
    super.onData(data);
    if (data != null) {
      logger.d(data);
      setUpEvents(data);
    }
  }

  void setUpEvents(List<EventDataModel>? events) {
    if (events?.isEmpty ?? false) {
      elements.clear();
      notifyListeners();
      return;
    } else {
      print(events?.length);
      for (var eventData in events!) {
        if (eventData.date != null) {
          // year = eventData.date!.substring(0, eventData.date!.indexOf('-'));
          // month = eventData.date!.substring(
          //     eventData.date!.indexOf(year), eventData.date!.indexOf('-'));
          // date = eventData.date!.substring(
          //     eventData.date!.indexOf(month), eventData.date!.indexOf('-'));
          elements.add({
            'name': eventData.event_title,
            'date': eventData.date,
            'event_id': eventData.event_id
          });
        }
      }
    }
  }

  @override
  Future<List<EventDataModel>?> futureToRun() {
    return _userService.getEvents();
  }

  changeEventDateAndFetch(DateTime dateTime) async {
    selectedDate = dateTime;
    // datePickController.animateToDate(selectedDate);
    // datePickController.animateToSelection();
    notifyListeners();
    setBusy(true);

    setUpEvents(await _userService.getEvents());
    setBusy(false);
    notifyListeners();
  }
}
