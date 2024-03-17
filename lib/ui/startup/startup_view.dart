import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:hkorn_new_dev_vijay/ui/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: model.isBusy ? loadingSpinnerWidget : model.widget,
      ),
    );
  }
}
