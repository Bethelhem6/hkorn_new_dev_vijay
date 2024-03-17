import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/notes_model.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';

class NotesViewModel extends FutureViewModel<List<NotesModel>?> {
  final _companyService = locator<UserService>();
  List<NotesModel> notes = [];

  @override
  void onData(List<NotesModel>? data) {
    super.onData(data);

    if (data != null) {
      notes.addAll(data);
    }
  }

  @override
  Future<List<NotesModel>?> futureToRun() {
    return _companyService.getNotes();
  }
}
