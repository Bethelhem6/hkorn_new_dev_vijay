import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/check_out/checkout_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_button.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_textformfeild.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckOutViewModel>.reactive(
      viewModelBuilder: () => CheckOutViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: BaseAppbar(
          context: context,
          title: "Checkout",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  Text("BILLING DETAILS",
                      textAlign: TextAlign.center, style: BaseFonts.headline()),
                  verticalSpaceTiny,
                  const Divider(
                    thickness: 1,
                    height: 3,
                  ),
                  verticalSpaceSmall,
                  BaseTextField(
                      label: "First Name*",
                      hintText: "name",
                      controller: model.firstName),
                  verticalSpaceSmall,
                  BaseTextField(
                      label: "Last Name*",
                      hintText: "name",
                      controller: model.lastName),
                  verticalSpaceSmall,
                  BaseTextField(
                      label: "Company Name(Optional)",
                      hintText: "Company Name(Optional)",
                      controller: model.companyName),
                  verticalSpaceSmall,
                  BaseTextField(
                      label: "Street address*",
                      hintText: "House number and street name",
                      controller: model.streetAddress),
                  verticalSpaceSmall,
                  const BaseTextField(
                      label: "",
                      hintText: "Apartment, suite, unit, etc. (Optional)"),
                  verticalSpaceSmall,
                  BaseTextField(
                      label: "Town/District*",
                      hintText: "Town/District",
                      controller: model.townDistrict),
                  verticalSpaceSmall,
                  BaseTextField(
                      label: "Postcode / ZIP (optional)",
                      hintText: "Postcode / ZIP (optional)",
                      controller: model.postcode),
                  verticalSpaceSmall,
                  BaseTextField(
                      label: "Phone (optional)",
                      hintText: "Company Name(Optional)",
                      controller: model.phone),
                  verticalSpaceSmall,
                  BaseTextField(
                      label: "Email Address*",
                      hintText: "demo@mail.com",
                      controller: model.email),
                  verticalSpaceSmall,
                  Text("ADDITIONAL INFORMATION",
                      textAlign: TextAlign.center,
                      style: BaseFonts.headline(fontSize: 16)),
                  verticalSpaceSmall,
                  const Divider(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: BaseTextField(
                        label: "Order notes (optional)",
                        hintText: "Notes about your order",
                        controller: model.orderNote),
                  ),
                  verticalSpaceMedium,
                  Button(
                    textColor: BaseColors.white,
                    text: "Proceed to checkout",
                    onPressed: () => model.navigateToCheckOut(),
                  ),
                  verticalSpaceLarge,
                ]),
          ),
        ),
      ),
    );
  }
}
