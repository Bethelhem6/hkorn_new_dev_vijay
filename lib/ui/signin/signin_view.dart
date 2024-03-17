import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/const/images_const.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_button.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_textformfeild.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:hkorn_new_dev_vijay/ui/signin/signin_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) => Scaffold(
          body: model.isBusy
              ? loadingSpinnerWidget
              : FutureBuilder(
                  builder: (context, snapshot) => SingleChildScrollView(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15, top: 35),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Form(
                        key: model.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(Images.black_logo,
                                    height: 150.0,
                                    fit: BoxFit.scaleDown,
                                    width: 120.0),
                                // Container(
                                //   height: 50,
                                //   width: 100,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(10.0),
                                //       border: Border.all(color: Colors.grey)),
                                //   child: DropdownButton<String>(
                                //     underline: SizedBox(),
                                //     items: <String>['English', 'فارسی', 'پشتو']
                                //         .map((String value) {
                                //       return DropdownMenuItem<String>(
                                //         value: value,
                                //         child: Text(value, style: BaseFonts.subHead(),),
                                //       );
                                //     }).toList(),
                                //     onChanged: (_) {},
                                //   ),
                                // )
                              ],
                            ),
                            verticalSpaceSmall,
                            Text("Sign In",
                                textAlign: TextAlign.center,
                                style: BaseFonts.subHeadBold(
                                  color: BaseColors.black,
                                  fontSize: 25,
                                )),
                            verticalSpaceMedium,
                            verticalSpaceSmall,
                            BaseTextField(
                              label: "Email",
                              hintText: "demo@email.com",
                              controller: model.emailController,
                              validator: model.validateEmail,
                            ),
                            verticalSpaceSmall,
                            Stack(
                              children: [
                                BaseTextField(
                                  label: "Password",
                                  hintText: "********",
                                  obscureText: model.passwordVisible,
                                  validator: model.validatePassword,
                                  controller: model.passwordController,
                                ),
                                Positioned(
                                  top: 50,
                                  right: 15,
                                  child: InkWell(
                                    child: Icon(
                                      model.passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: BaseColors.greyColor,
                                    ),
                                    onTap: () => model.toggelPassword(),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Material(
                                  child: Checkbox(
                                    value: model.rememberMe,
                                    onChanged: model.changeRemState,
                                  ),
                                ),
                                Text('Remember Me',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: BaseFonts.footNote()),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                              ),
                              child: Button(
                                textColor: BaseColors.white,
                                text: "Login",
                                onPressed: () => model.navigateToHome(),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Forgot Password? ",
                                      textAlign: TextAlign.center,
                                      style: BaseFonts.subHead()),
                                  GestureDetector(
                                    onTap: model.forgetPassword,
                                    child: Text("Click Here",
                                        textAlign: TextAlign.center,
                                        style: BaseFonts.headline2(
                                            color: BaseColors.primaryColor,
                                            fontSize: 15)),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: model.navigateToCreate,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account?",
                                        textAlign: TextAlign.center,
                                        style: BaseFonts.subHead(fontSize: 15)),
                                    horizontalSpaceTiny,
                                    Text(
                                      "Create New",
                                      textAlign: TextAlign.center,
                                      style: BaseFonts.headline2(
                                          color: BaseColors.primaryColor,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  future: null,
                )),
    );
  }
}
