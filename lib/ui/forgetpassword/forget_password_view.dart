import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/forgetpassword/forget_password_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_button.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_textformfeild.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgetPasswordViewModel>.reactive(
      viewModelBuilder: () => ForgetPasswordViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: BaseColors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 35,
                color: BaseColors.black,
              ),
              onPressed: model.navigateToSignIn,
            ),
          ),
          body: model.isBusy
              ? loadingSpinnerWidget
              : SingleChildScrollView(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 10, top: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Forgot your password?",
                            textAlign: TextAlign.center,
                            style: BaseFonts.headline2(
                                color: BaseColors.black, fontSize: 25)),
                        verticalSpaceSmall,
                        Text(
                            "Please enter your email address. You will receive an email with instructions on how to reset your password.",
                            textAlign: TextAlign.left,
                            style: BaseFonts.subHead()),
                        verticalSpaceMedium,
                        BaseTextField(
                          label: "Email",
                          hintText: "Enter your mail",
                          controller: model.emailCont,
                        ),
                        verticalSpaceMedium,
                        Button(
                          textColor: BaseColors.white,
                          text: "Request reset link",
                          onPressed: model.requestLink,
                        ),
                        verticalSpaceSmall,
                        Center(
                          child: GestureDetector(
                            onTap: model.navigateToSignIn,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 15),
                              child: Text("Back to Sign In",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: BaseColors.primaryColor,
                                      fontSize: 18)),
                            ),
                          ),
                        )
                      ]))),
    );
  }
}
