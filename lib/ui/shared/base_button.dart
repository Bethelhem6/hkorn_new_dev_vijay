import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';

class Button extends StatelessWidget {
  final double? width;
  final double? height;
  final Function? onPressed;
  final Widget? child;
  final String? text;
  final Widget? leading;
  final Widget? trailing;
  final BoxShape? boxShape;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final List<Color>? backgroundColors;
  final Color? textColor;
  final double? textsize;
  final Color? backgroundColor;
  final BoxBorder? border;

  const Button(
      {Key? key,
      this.width,
      this.height = 50.0,
      this.onPressed,
      this.child,
      this.text,
      this.leading,
      this.trailing,
      this.padding,
      this.backgroundColors,
      this.textColor = BaseColors.white,
      this.borderRadius,
      this.boxShape,
      this.textsize,
      this.backgroundColor,
      this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed?.call();
      },
      child: Container(
        width: width,
        height: height,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          shape: boxShape ?? BoxShape.rectangle,
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
            begin: const Alignment(-1.0, -1),
            end: const Alignment(1.0, 1),
            colors: backgroundColors ??
                <Color>[
                  BaseColors.primaryColor,
                  BaseColors.primaryColor,
                ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text ?? '',
              style: TextStyle(
                  fontSize: textsize ?? 16,
                  color: textColor,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
