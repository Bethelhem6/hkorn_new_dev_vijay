import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/notes/notes_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:stacked/stacked.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotesViewModel>.reactive(
      viewModelBuilder: () => NotesViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: BaseAppbar(
          title: 'Notes',
          context: context,
        ),
        body: ListView.builder(
            itemCount: model.notes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      model.notes[index].note_title,
                      style: BaseFonts.subHeadBold(),
                    ),
                    const Divider(
                      thickness: 0.8,
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
