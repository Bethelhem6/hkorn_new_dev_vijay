import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';

import '../../const/consts.dart';
import 'base_fonts.dart';

class BaseAppbar extends AppBar {
  BaseAppbar(
      {Key? key,
      required title,
      required BuildContext context,
      List<Widget>? action,
      Color? color,
      automaticallyImplyLeading = true})
      : super(
          key: key,
          backgroundColor: BaseColors.white,
          elevation: 0,
          titleSpacing: 0,
          actions: action,
          centerTitle: true,
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: BaseColors.primaryColor),
          title: Stack(
            alignment: Alignment.center,
            children: [
              if (automaticallyImplyLeading)
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      padding: const EdgeInsets.only(left: 1),
                      splashRadius: splashRadius,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 28,
                      )),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: BaseFonts.headline().copyWith(color: color),
                ),
              ),
            ],
          ),
        );
}
