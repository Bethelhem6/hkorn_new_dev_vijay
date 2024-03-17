import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/notes_detail/note_detail_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:stacked/stacked.dart';

class NoteDetailView extends StatelessWidget {
  const NoteDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NoteDetailViewModel>.reactive(
      viewModelBuilder: () => NoteDetailViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: BaseAppbar(
          title: "Note Detail",
          context: context,
        ),
        body: Column(),
      ),
    );
  }
}
