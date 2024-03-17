import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/const/images_const.dart';
import 'package:hkorn_new_dev_vijay/ui/renewal/renewal_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_button.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class RenewalView extends StatelessWidget {
  const RenewalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RenewalViewModel>.reactive(
      viewModelBuilder: () => RenewalViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: BaseAppbar(
          context: context,
          title: "Events List",
          // action: [
          //   IconButton(
          //     onPressed: () {
          //       // Navigator.of(context).push(MaterialPageRoute(
          //       //     builder: (BuildContext context) => Notification_page()));
          //     },
          //     icon: const Icon(Icons.filter_alt),
          //     color: BaseColors.primaryColor,
          //   )
          // ],
        ),
        body: model.isBusy
            ? loadingSpinnerWidget
            : Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.5),
                  ),
                  itemCount: model.events.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: model.navigateToDetail,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: BaseColors.borderColor)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(Images.event,
                                  height: 110.0,
                                  fit: BoxFit.fill,
                                  width: 150.0),
                              Text(model.events[index].event_title,
                                  textAlign: TextAlign.center,
                                  style: BaseFonts.headline2(fontSize: 14)),
                              verticalSpaceSmall,
                              Text(model.events[index].price,
                                  textAlign: TextAlign.center,
                                  style: BaseFonts.headline(
                                      color: BaseColors.primaryColor)),
                              verticalSpaceSmall,
                              Button(
                                padding: EdgeInsets.zero,
                                text: "Add to Basket",
                                textColor: BaseColors.white,
                                height: 35,
                                textsize: 13,
                                onPressed: () => model.addToBasket(
                                    int.parse(model.events[index].event_id), 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
      ),
    );
  }
}
