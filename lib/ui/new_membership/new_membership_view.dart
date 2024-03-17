import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/new_membership/new_membership_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_button.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_image.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class NewMemberShipView extends StatelessWidget {
  const NewMemberShipView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewMemberShipViewModel>.reactive(
        viewModelBuilder: () => NewMemberShipViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: BaseColors.white,
              appBar: BaseAppbar(
                context: context,
                title: 'Events Details',
                automaticallyImplyLeading: false,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: BaseImage(
                            url:
                                'https://hkornrenew.mockup-design.com/wp-content/uploads/2021/03/HKORN_MEMBERSHIP_Subscription_smallwhitebg.png',
                            width: 300,
                            height: 250),
                      ),
                      Text("HKORN NEW MEMBERSHIP",
                          style: BaseFonts.title4(
                              fontSize: 18, color: Colors.black)),
                      verticalSpaceSmall,
                      Text("HK\$100",
                          style: BaseFonts.headline(
                              fontSize: 24, color: BaseColors.primaryColor)),
                      verticalSpaceMedium,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        child: Text(
                            "HK\$100 / year with a sign-up fee of HK\$100",
                            style: BaseFonts.title4(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.70))),
                      ),
                      Text(
                          "Application for New Membership (April 2021 - March 2022)",
                          style: BaseFonts.title4(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.70))),
                      verticalSpaceRegular,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text("Payment method:",
                            style: BaseFonts.headline(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.70))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "FPS 付款",
                          style: BaseFonts.title4(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.70)),
                        ),
                      ),
                      verticalSpaceSmall,
                      Text(
                        "SPECS",
                        style: BaseFonts.headline(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.70)),
                      ),
                      verticalSpaceRegular,
                      Text(
                        "SKU:   New2022",
                        style: BaseFonts.title4(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.70)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Text(
                              'Category:',
                              style: BaseFonts.subHead(),
                            ),
                            Text(
                              "   未分類",
                              style: BaseFonts.subHead(
                                  color: BaseColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      verticalSpaceRegular,
                      Text(
                        'Description:',
                        style: BaseFonts.subHead().copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      verticalSpaceSmall,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        child: Text(
                            "HK\$100 / year with a sign-up fee of HK\$100",
                            style: BaseFonts.title4(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.70))),
                      ),
                      Text(
                          "Application for New Membership (April 2021 - March 2022)",
                          style: BaseFonts.title4(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.70))),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        child: Text(
                            "New Membership Fee (\$200 (\$100 Sign up Fee + \$100 One-year membership Fee)",
                            style: BaseFonts.title4(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.70))),
                      ),
                      verticalSpaceRegular,
                      Text(
                        'Cash payment is not accepted.:',
                        style: BaseFonts.subHead().copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      verticalSpaceMedium,
                      Text(
                        'Related products',
                        style: BaseFonts.subHead().copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.70)),
                      ),
                      verticalSpaceLarge,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: [
                            Container(
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      color: const Color(0xffDADADA))),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        // model.incCount();
                                      },
                                      child:
                                          const Icon(Icons.remove, size: 20)),
                                  const SizedBox(width: 10),
                                  Text('${model.count}'),
                                  horizontalSpaceSmall,
                                  GestureDetector(
                                      onTap: () {
                                        model.incCount();
                                      },
                                      child: const Icon(Icons.add, size: 20)),
                                  horizontalSpaceSmall,
                                ],
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Expanded(
                              child: Button(
                                textColor: BaseColors.white,
                                text: "Subscribe",
                                backgroundColor: Colors.green,
                                height: 48,
                                borderRadius: BorderRadius.circular(8.0),
                                onPressed: () {
                                  // model.navigateToHome();
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) => Container(
                                            height: 540,
                                            padding: const EdgeInsets.all(16.0),
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25.0),
                                                    topRight:
                                                        Radius.circular(25.0))),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      icon: const Icon(
                                                          Icons.close)),
                                                ),
                                                Text(
                                                  '“HKORN NEW MEMBERSHIP” has been added to your basket.',
                                                  style: BaseFonts.subHead()
                                                      .copyWith(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 24.0),
                                                  child: BaseImage(
                                                      url:
                                                          'https://hkornrenew.mockup-design.com/wp-content/uploads/2021/03/HKORN_MEMBERSHIP_Subscription_smallwhitebg.png',
                                                      width: 240,
                                                      height: 165),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 12.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Subtotal:',
                                                        style: BaseFonts
                                                                .subHead()
                                                            .copyWith(
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.70)),
                                                      ),
                                                      horizontalSpaceMedium,
                                                      Text(
                                                        "HK\$100",
                                                        style: BaseFonts.subHead(
                                                                fontSize: 18.0,
                                                                color: BaseColors
                                                                    .primaryColor)
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                verticalSpaceMedium,
                                                Button(
                                                  textColor: BaseColors.white,
                                                  text: "Proceed to checkout",
                                                  backgroundColor: Colors.green,
                                                  height: 48,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  onPressed: () {
                                                    model.navigateToHome();
                                                  },
                                                ),
                                                TextButton(
                                                    onPressed: () {},
                                                    child: Text('View Basket',
                                                        style: GoogleFonts.poppins(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: BaseColors
                                                                .primaryColor)))
                                              ],
                                            ),
                                          ),
                                      isScrollControlled: true);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
