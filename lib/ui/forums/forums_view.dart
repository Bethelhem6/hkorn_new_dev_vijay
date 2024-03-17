import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/forums/forums_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/horizontal_filter.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class ForumsView extends StatelessWidget {
  const ForumsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForumViewModel>.reactive(
      viewModelBuilder: () => ForumViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: BaseAppbar(
          context: context,
          title: "Forums",
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 15),
              child: HorizontalScrollableItems(
                items: model.items,
                onTap: () {},
              ),
            ),
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Forum Discussion Started",
                style: BaseFonts.headline(
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/forum.png',
                      height: 200,
                    ),
                  ),
                  verticalSpaceMedium,
                  Center(
                    child: Text(
                      "You have no created any discussions.",
                      style: BaseFonts.subHead(color: BaseColors.greyColor),
                    ),
                  ),
                  verticalSpaceMedium,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
