import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/const/images_const.dart';
import 'package:hkorn_new_dev_vijay/ui/renewal_deals/renewal_deals_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_button.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class RenewalDetailView extends StatelessWidget {
  const RenewalDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => RenewalDealViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: BaseColors.white,
              appBar: BaseAppbar(
                title: 'Events Details',
                context: context,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(Images.event,
                            height: 250.0, fit: BoxFit.cover, width: 250.0),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("HKORN MEMBERSHIP RENEWAL",
                          textAlign: TextAlign.left,
                          style: BaseFonts.headline2()),
                      verticalSpaceSmall,
                      Text("HK\$50",
                          textAlign: TextAlign.center,
                          style: BaseFonts.subHeadBold(
                              color: BaseColors.primaryColor, fontSize: 19)),
                      verticalSpaceCustom(height: 20),
                      Text(
                        "Annual Subscription for renewal of membership (all types - ordinary / affiliated / retired):",
                        style: BaseFonts.subHead(),
                      ),
                      verticalSpaceSmall,
                      Text(
                        "\$50 per year (Special offer until Apr 30. Regular Fee: \$100)",
                        style: BaseFonts.subHead(),
                      ),
                      verticalSpaceCustom(height: 20),
                      Text(
                        "Payment Method: ",
                        style: BaseFonts.headline(fontSize: 16),
                      ),
                      verticalSpaceTiny,
                      Text(
                        "FPS 付款",
                        style: BaseFonts.subHead(),
                      ),
                      verticalSpaceMedium,
                      Text(
                        "SPECS",
                        style: BaseFonts.headline(fontSize: 16),
                      ),
                      verticalSpaceTiny,
                      Text(
                        "SKU:   Renewal2022",
                        style: BaseFonts.subHead(),
                      ),
                      Row(
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
                      verticalSpaceMedium,
                      Text(
                        "Description",
                        style: BaseFonts.headline(fontSize: 16),
                      ),
                      Text(
                        "Annual subscription for renewal of"
                        " membership (all types - ordinary /affiliated / retired):",
                        style: BaseFonts.subHead(),
                      ),
                      verticalSpaceSmall,
                      Text(
                        "\$50 per year (Special offer until Apr 30. Regular Fee: \$100)",
                        style: BaseFonts.subHead(),
                      ),
                      verticalSpaceSmall,
                      Text(
                        "FPS 付款 (FPS: 164037426)",
                        style: BaseFonts.subHead(),
                      ),
                      verticalSpaceSmall,
                      Text("Cash payment is not accepted.",
                          textAlign: TextAlign.left,
                          style: BaseFonts.subHead()),
                      verticalSpaceMedium,
                      related(context),
                      verticalSpaceMedium,
                      Row(
                        children: [
                          Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 3.5,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: BaseColors.borderColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: BaseColors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text("-",
                                        textAlign: TextAlign.left,
                                        style: BaseFonts.subHead(
                                            fontSize: 18,
                                            color: BaseColors.primaryColor)),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Text("1",
                                      textAlign: TextAlign.left,
                                      style: BaseFonts.subHeadBold(
                                          fontSize: 18,
                                          color: BaseColors.primaryColor)),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Text("+",
                                      textAlign: TextAlign.left,
                                      style: BaseFonts.subHead(
                                          fontSize: 18,
                                          color: BaseColors.primaryColor)),
                                ],
                              )),
                          horizontalSpaceMedium,
                          Expanded(
                            child: Button(
                              textColor: BaseColors.white,
                              text: "Add to Basket",
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceLarge,
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget related(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0, top: 10),
          child: Text("Related products",
              textAlign: TextAlign.left,
              style: BaseFonts.headline(fontSize: 16)),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.5),
          ),
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: BaseColors.borderColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(Images.event,
                          height: 110.0, fit: BoxFit.fill, width: 150.0),
                      Text("HKORN MEMBERSHIP RENEWAL",
                          textAlign: TextAlign.center,
                          style: BaseFonts.headline2(fontSize: 14)),
                      verticalSpaceSmall,
                      Text("HK\$50",
                          textAlign: TextAlign.center,
                          style: BaseFonts.headline(
                              color: BaseColors.primaryColor)),
                      verticalSpaceSmall,
                      const Button(
                        padding: EdgeInsets.zero,
                        text: "Add to Basket",
                        textColor: BaseColors.white,
                        height: 35,
                        textsize: 13,
                        onPressed: null,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
