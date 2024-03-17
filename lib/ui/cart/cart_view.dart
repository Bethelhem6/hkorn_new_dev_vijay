import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/cart/cart_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_button.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: BaseAppbar(
          context: context,
          title: 'My Cart',
          automaticallyImplyLeading: false,
        ),
        body: model.isBusy
            ? loadingSpinnerWidget
            : model.cartItems.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "No Cart item was found.",
                        style: BaseFonts.subHeadBold(),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      ListView.separated(
                          shrinkWrap: true,
                          itemCount: model.cartItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.all(10.0),
                              height: 100,
                              color: BaseColors.white,
                              child: Row(
                                children: [
                                  ExtendedImage.network(
                                      model.cartItems[index].product_data.image,
                                      height: 80.0,
                                      fit: BoxFit.scaleDown,
                                      width: 80.0),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          model.cartItems[index].product_data
                                              .name,
                                          textAlign: TextAlign.left,
                                          style: BaseFonts.subHead()),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 180,
                                              child: Text(
                                                  "HK\$ " +
                                                      model.cartItems[index]
                                                          .product_data.price
                                                          .toString(),
                                                  style: BaseFonts.headline(
                                                      fontSize: 16)),
                                            ),
                                            Container(
                                                height: 35,
                                                width: 105,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: BaseColors
                                                        .textFormFillColor),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: model.decCount,
                                                      child: Text(" -",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style:
                                                              BaseFonts.subHead(
                                                                  fontSize:
                                                                      18)),
                                                    ),
                                                    const SizedBox(
                                                      width: 20.0,
                                                    ),
                                                    Text(
                                                        model.count[model
                                                                .cartItems[
                                                                    index]
                                                                .product_id]
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: BaseFonts
                                                            .subHeadBold(
                                                                fontSize: 18)),
                                                    const SizedBox(
                                                      width: 20.0,
                                                    ),
                                                    GestureDetector(
                                                      onTap: model.incCount,
                                                      child: Text("+",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style:
                                                              BaseFonts.subHead(
                                                                  fontSize:
                                                                      18)),
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              height: 1,
                              color: BaseColors.white,
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sub Total",
                                    textAlign: TextAlign.left,
                                    style: BaseFonts.headline(fontSize: 14)),
                                Text("HK\$100",
                                    textAlign: TextAlign.left,
                                    style: BaseFonts.headline(fontSize: 18))
                              ],
                            ),
                            verticalSpaceTiny,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Subscription Signup Fee",
                                    textAlign: TextAlign.left,
                                    style: BaseFonts.headline(fontSize: 14)),
                                Text("HK\$100",
                                    textAlign: TextAlign.left,
                                    style: BaseFonts.headline(fontSize: 18))
                              ],
                            ),
                            verticalSpaceSmall,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("TOTAL",
                                    textAlign: TextAlign.left,
                                    style: BaseFonts.headline(fontSize: 20)
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: BaseColors.primaryColor)),
                                Text("HK\$200",
                                    textAlign: TextAlign.left,
                                    style: BaseFonts.headline(fontSize: 20)
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: BaseColors.primaryColor))
                              ],
                            ),
                            SizedBox(height: screenHeight(context) * 0.32),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Button(
                                textColor: BaseColors.white,
                                text: "Place Order",
                                onPressed: () => model.navigateToCheckOut(),
                              ),
                            ),
                            verticalSpaceTiny,
                            Button(
                              textColor: BaseColors.primaryColor,
                              backgroundColors: const [
                                BaseColors.white,
                                BaseColors.white,
                              ],
                              text: "Update Basket",
                              onPressed: () {
                                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                //     builder: (BuildContext context) => Main_page()));
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
      ),
    );
  }
}
