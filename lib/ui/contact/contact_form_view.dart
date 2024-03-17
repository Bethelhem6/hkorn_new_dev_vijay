import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/const/consts.dart';
import 'package:hkorn_new_dev_vijay/ui/contact/contact_form_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_button.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_textformfeild.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class ContactFormView extends StatelessWidget {
  const ContactFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactFormViewModel>.reactive(
      viewModelBuilder: () => ContactFormViewModel(),
      builder: (context, model, child) => SafeArea(
        bottom: true,
        left: false,
        right: false,
        top: false,
        child: Scaffold(
          backgroundColor: BaseColors.white,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: BaseColors.white,
                child: Column(
                  children: [
                    verticalSpaceRegular,
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: sidePadding),
                      child: Button(
                        textColor: BaseColors.white,
                        text: "Submit",
                        onPressed: model.submitForm,
                      ),
                    ),
                    verticalSpaceRegular,
                  ],
                ),
              ),
            ],
          ),
          appBar: BaseAppbar(
            context: context,
            title: "Contact Form",
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: sidePadding),
            child: Column(
              children: [
                Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      BaseTextField(
                        label: "Your name",
                        hintText: "joe",
                        controller: model.nameController,
                        validator: (String val) {
                          if (val.isEmpty) {
                            return "Name is required";
                          }
                        },
                      ),
                      verticalSpaceSmall,
                      BaseTextField(
                        label: "Your email",
                        hintText: "demo@gmail.com",
                        controller: model.emailController,
                        validator: (String val) {
                          if (val.isEmpty) {
                            return "Email is required";
                          }
                        },
                      ),
                      verticalSpaceSmall,
                      BaseTextField(
                        label: "Subject",
                        hintText: "demo subject",
                        controller: model.subjectController,
                        validator: (String val) {
                          if (val.isEmpty) {
                            return "Subject is required";
                          }
                        },
                      ),
                      verticalSpaceSmall,
                      BaseTextField(
                          controller: model.messageController,
                          label: "Your message(optional)",
                          maxLines: 5,
                          validator: (String val) {
                            if (val.isEmpty) {
                              return "Message is required";
                            }
                          },
                          hintText: "Your message"),
                      verticalSpaceMedium,
                    ],
                  ),
                ),
                verticalSpaceMedium,
                Container(
                  color: const Color(0xFFC9E1DB),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceSmall,
                      Text(
                        "Contact Information",
                        style: BaseFonts.headline(fontSize: 16),
                      ),
                      verticalSpaceTiny,
                      Text(
                        "Association of Hong Kong Operation Room Nurses (HKORN)",
                        style: BaseFonts.footNote2(color: BaseColors.greyColor),
                      ),
                      verticalSpaceMedium,
                      Text(
                        "Email",
                        style: BaseFonts.headline(fontSize: 16),
                      ),
                      verticalSpaceTiny,
                      Text(
                        "contact@hkorn.org.hk",
                        style: BaseFonts.footNote2(color: BaseColors.greyColor),
                      ),
                      verticalSpaceMedium,
                      Text(
                        "Working Hours",
                        style: BaseFonts.headline(fontSize: 16),
                      ),
                      verticalSpaceTiny,
                      Text(
                        "Saturday - 10:00 - 06:00 PM,",
                        style: BaseFonts.footNote2(color: BaseColors.greyColor),
                      ),
                      Text(
                        "Tuesday - 9:00 - 05:00 PM,",
                        style: BaseFonts.footNote2(color: BaseColors.greyColor),
                      ),
                      Text(
                        "Thursday - 10:00 - 06:00 PM,",
                        style: BaseFonts.footNote2(color: BaseColors.greyColor),
                      ),
                      verticalSpaceRegular,
                      verticalSpaceRegular,
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
