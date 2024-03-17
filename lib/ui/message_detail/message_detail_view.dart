import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/const/images_const.dart';
import 'package:hkorn_new_dev_vijay/ui/message_detail/message_detail_page_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';

class MessageDetailView extends StatelessWidget {
  const MessageDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageDetailViewModel>.reactive(
        viewModelBuilder: () => MessageDetailViewModel(),
        builder: (context, model, child) => Scaffold(
            appBar: BaseAppbar(
              context: context,
              title: 'Message',
              automaticallyImplyLeading: false,
            ),
            body: model.isBusy
                ? loadingSpinnerWidget
                : Column(
                    children: [
                      Image.asset(
                        Images.chatBackground,
                        width: 120,
                        height: 127,
                      )
                    ],
                  )));
  }
}
