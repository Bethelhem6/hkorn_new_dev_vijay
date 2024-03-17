import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';

class Bubble extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final bool showBorder;

  const Bubble(
      {Key? key,
      required this.title,
      required this.onTap,
      this.showBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 30,
          width: 75,
          decoration: BoxDecoration(
              border: showBorder
                  ? Border.all(color: BaseColors.primaryColor)
                  : null,
              borderRadius: BorderRadius.circular(8.0),
              color: BaseColors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: BaseFonts.caption(color: BaseColors.primaryColor)),
            ],
          )),
    );
  }
}
