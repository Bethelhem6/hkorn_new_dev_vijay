import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/model/contact_form.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ContactFormViewModel extends BaseViewModel {
  final _userService = locator<UserService>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _key = StackedService.navigatorKey!;

  GlobalKey get formKey => _formKey;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ContactForm contactForm = ContactForm(
        name: nameController.text,
        email: emailController.text,
        subject: subjectController.text,
        message: messageController.text,
      );
      setBusy(true);
      Map? data = await _userService.submitContactForm(contactForm.toMap());
      setBusy(false);
      if (data != null) {
        FlushbarHelper.createSuccess(message: "Form has been Submitted")
            .show(_key.currentContext!);
      } else {
        FlushbarHelper.createError(message: "Form has not been Submitted")
            .show(_key.currentContext!);
      }
    }
  }
}
