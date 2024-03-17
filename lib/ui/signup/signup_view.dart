import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/const/consts.dart';
import 'package:hkorn_new_dev_vijay/const/images_const.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_button.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_textformfeild.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/dropdown.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:hkorn_new_dev_vijay/ui/signup/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
        padding: const EdgeInsets.only(
            left: sidePadding, right: sidePadding, top: 80),
        child: model.isBusy
            ? Center(child: loadingSpinnerWidget)
            : Form(
                key: model.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(Images.black_logo,
                        fit: BoxFit.scaleDown, width: 120.0),
                    verticalSpaceMedium,
                    Text(
                      "New Register",
                      textAlign: TextAlign.center,
                      style: BaseFonts.subHeadBold(
                          color: Colors.black, fontSize: 28),
                    ),
                    Text("for 2021 - 2022 membership",
                        textAlign: TextAlign.center,
                        style: BaseFonts.subHead(
                            color: Colors.black, fontSize: 14)),
                    verticalSpaceMedium,
                    BaseTextField(
                      label: "Email",
                      hintText: "demo@email.com",
                      validator: model.validateEmail,
                      controller: model.emailCont,
                    ),
                    verticalSpaceSmall,
                    BaseTextField(
                      label: "Confirm Email",
                      hintText: "demo@email.com",
                      validator: model.validateConfirmEmail,
                      controller: model.confirmEmailCont,
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
                    verticalSpaceSmall,
                    Stack(
                      children: [
                        BaseTextField(
                          label: "Confirm Password",
                          hintText: "********",
                          obscureText: model.passwordVisibleConfirm,
                          validator: model.validateConfrimPassword,
                          controller: model.passwordControllerConfirm,
                        ),
                        Positioned(
                          top: 50,
                          right: 15,
                          child: InkWell(
                            child: Icon(
                              model.passwordVisibleConfirm
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: BaseColors.greyColor,
                            ),
                            onTap: () => model.toggelPasswordConfirm(),
                          ),
                        )
                      ],
                    ),
                    verticalSpaceSmall,
                    BaseTextField(
                      label: "First Name",
                      hintText: "demo",
                      validator: model.validateFirstName,
                      controller: model.firstNameCont,
                    ),
                    verticalSpaceSmall,
                    BaseTextField(
                        label: "Surname",
                        hintText: "demo",
                        controller: model.surNameCon,
                        validator: model.validateSurName),
                    verticalSpaceSmall,
                    BaseTextField(
                        label: "Nickname",
                        hintText: "demo",
                        controller: model.nickNameCont,
                        validator: model.validateNickName),
                    verticalSpaceSmall,
                    const BaseTextField(
                        label: "Name in Chinese (Optional)",
                        hintText: "Name(Optional)"),
                    verticalSpaceSmall,
                    DropdownExtended(
                      title: "Gender",
                      items: model.gender,
                      onChanged: model.onChangedGender,
                    ),
                    verticalSpaceSmall,
                    DropdownExtended(
                      items: model.hospitals,
                      title: "Hospital / Institute",
                      onChanged: model.onChangedHospital,
                    ),
                    verticalSpaceSmall,
                    DropdownExtended(
                      title: "RANK",
                      items: model.rank,
                      onChanged: model.onChangedRank,
                    ),
                    verticalSpaceSmall,
                    BaseTextField(
                      label: "Post",
                      hintText: "Post",
                      validator: model.validatePost,
                      controller: model.postCont,
                    ),
                    verticalSpaceSmall,
                    DropdownExtended(
                      items: model.dep,
                      title: "Dept / Speciality",
                      onChanged: model.changedSpecalist,
                    ),
                    verticalSpaceSmall,
                    DropdownExtended(
                      items: model.membership,
                      title: "Membership Type",
                      onChanged: model.onChangeMembershipType,
                    ),
                    verticalSpaceSmall,
                    BaseTextField(
                      label: "Remark (Optional)",
                      hintText: "Remark (Optional)",
                      inputType: TextInputType.text,
                      controller: model.remarkCont,
                    ),
                    verticalSpaceSmall,
                    Text(
                        "Please specify your workplace here if you cannot find it in the pull down list",
                        textAlign: TextAlign.left,
                        style: BaseFonts.caption(color: BaseColors.greyColor)),
                    verticalSpaceSmall,
                    BaseTextField(
                      label: "Contact Number",
                      hintText: "Contact Number",
                      controller: model.contactNumberCont,
                      inputType: TextInputType.number,
                      validator: model.validateContact,
                    ),
                    verticalSpaceSmall,
                    Row(
                      children: [
                        Material(
                          child: Checkbox(
                            value: model.checkBoxVal,
                            onChanged: model.changeCheckBox,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                                'By creating an account you are agreeing to the',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: BaseFonts.subHead(
                                    color: BaseColors.black, fontSize: 12)),
                            Text('Terms of Service.',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: BaseFonts.subHead(
                                    color: BaseColors.primaryColor,
                                    fontSize: 12))
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                      ),
                      child: Button(
                        text: "Create Account",
                        textColor: BaseColors.white,
                        onPressed: model.createAccount,
                      ),
                    ),
                    verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Do have an account?",
                              textAlign: TextAlign.center,
                              style: BaseFonts.subHead(
                                  color: Colors.black, fontSize: 15)),
                          horizontalSpaceTiny,
                          GestureDetector(
                            onTap: model.goToSignIn,
                            child: Text("Sign In",
                                textAlign: TextAlign.center,
                                style: BaseFonts.subHead(
                                    color: BaseColors.primaryColor,
                                    fontSize: 15)),
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                  ],
                ),
              ),
      )),
    );
  }
}
