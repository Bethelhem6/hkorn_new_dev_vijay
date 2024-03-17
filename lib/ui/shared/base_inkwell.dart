import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';

class BaseInkWell extends InkWell {
  BaseInkWell(
      {Key? key,
      required Function onTap,
      required Widget child,
      dynamic secondParameter,
      dynamic parameter})
      : super(
          key: key,
          onTap: parameter == null
              ? () => onTap()
              : secondParameter == null
                  ? () => onTap(parameter)
                  : () => onTap(parameter, secondParameter),
          child: child,
          hoverColor: BaseColors.transparent,
          splashColor: BaseColors.transparent,
          focusColor: BaseColors.transparent,
          highlightColor: BaseColors.transparent,
        );
}
