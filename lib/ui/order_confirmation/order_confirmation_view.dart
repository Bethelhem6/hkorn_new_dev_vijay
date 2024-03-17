import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/order_confirmation/order_confirmation_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class OrderConfirmationView extends StatelessWidget {
  const OrderConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => OrderConfirmationViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: BaseColors.white,
              appBar: BaseAppbar(
                context: context,
                title: 'Order Confirmation',
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: BaseColors.checkMarkGreen,
                        size: 120,
                      ),
                      verticalSpaceMedium,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Your Order Confirmed",
                              style: BaseFonts.headline(),
                            ),
                            Text(
                              "Thank you. Your order has been received",
                              style: BaseFonts.subHead(fontSize: 14),
                            ),
                            verticalSpaceMedium,
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 15),
                              color: const Color(0xFFF9F9F9),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: textWidget(
                                          data: "ORDER NUMBER:",
                                          color: BaseColors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: textWidget(
                                          data: "DATE:",
                                          color: BaseColors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpaceTiny,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: textWidget(
                                          data: "11449",
                                          color: BaseColors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: textWidget(
                                          data: "2022-05-16",
                                          color: BaseColors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpaceMedium,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: textWidget(
                                          data: "EMAIL:",
                                          color: BaseColors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: textWidget(
                                          data: "TOTAL:",
                                          color: BaseColors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpaceTiny,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: textWidget(
                                          data: "demo@mail.com",
                                          color: BaseColors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: textWidget(
                                          data: "HK\$650",
                                          color: BaseColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpaceMedium,
                                  textWidget(
                                    data: "PAYMENT METHOD:",
                                    color: BaseColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  verticalSpaceTiny,
                                  textWidget(
                                    data:
                                        "「轉數快FPS」付款 透過「轉數快FPS」匯出款項後, 請在訂單詳細信息頁面中提供你嘅參考編號。",
                                    color: BaseColors.black,
                                    fontWeight: null,
                                    fontSize: 14.0,
                                  ),
                                ],
                              ),
                            ),
                            verticalSpaceMedium,
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 15),
                              color: const Color(0xFFF9F9F9),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textWidget(
                                      data: 'Billing Address',
                                      color: BaseColors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                  verticalSpaceSmall,
                                  textWidget(
                                    data: "jon doe",
                                    color: BaseColors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                  verticalSpaceTiny,
                                  textWidget(
                                    data: "Company Name",
                                    color: BaseColors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                  verticalSpaceTiny,
                                  textWidget(
                                    data: "Full Address",
                                    color: BaseColors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                  verticalSpaceTiny,
                                  textWidget(
                                    data: "Addis Ababa 12003 ",
                                    color: BaseColors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                  verticalSpaceTiny,
                                  textWidget(
                                    data: "Ethiopia ",
                                    color: BaseColors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                  verticalSpaceMedium,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      textWidget(
                                        data: "Phone",
                                        color: BaseColors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                      textWidget(
                                        data: " +2519128899",
                                        color: BaseColors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                    ],
                                  ),
                                  verticalSpaceTiny,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      textWidget(
                                        data: "Email:",
                                        color: BaseColors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                      textWidget(
                                        data: " abel@gmail.com",
                                        color: BaseColors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            verticalSpaceMedium,
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Thank you for shopping with us!',
                                    textAlign: TextAlign.start,
                                    style: BaseFonts.headline(fontSize: 14),
                                  ),
                                  Text(
                                    "We'll be sending a confirmation email when the order is processed",
                                    style: BaseFonts.footNote2(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            verticalSpaceLarge,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget textWidget(
      {required data, required color, required fontSize, required fontWeight}) {
    return Text(
      data,
      textAlign: TextAlign.start,
      style:
          TextStyle(fontWeight: fontWeight, color: color, fontSize: fontSize),
    );
  }
}
