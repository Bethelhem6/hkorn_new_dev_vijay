import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';

Widget loadingSpinnerWidget = const Center(
  child: SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(BaseColors.primaryColor),
        strokeWidth: 3,
      )),
);
