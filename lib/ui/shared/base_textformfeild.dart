// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:ui_helper/ui_helper.dart';

class ExtendedTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final String labelText;
  final TextInputType type;
  final Function? onChanged;
  final Function? onSubmit;
  final Widget? prefixWidget;
  final Widget? suffix;
  final Color? fillColor;
  final bool? alignLabelWithHint;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? suffixIconConstraints;
  final int? maxLines;
  final bool enabled;
  final bool obscure;
  final bool showDecoration;
  final TextCapitalization textCapitalization;
  final double height;

  const ExtendedTextFormField(
      {Key? key,
      required this.controller,
      required this.validator,
      required this.labelText,
      required this.type,
      this.onChanged,
      this.onSubmit,
      this.prefixWidget,
      this.contentPadding,
      this.suffix,
      this.suffixIconConstraints,
      this.fillColor,
      this.alignLabelWithHint = false,
      this.textCapitalization = TextCapitalization.none,
      this.maxLines,
      this.showDecoration = false,
      this.enabled = true,
      this.height = 150,
      this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height != 150 && maxLines == null
          ? height + 12
          : maxLines == null
              ? 70
              : height + 13,
      child: TextFormField(
        key: key,
        onFieldSubmitted: onSubmit == null ? null : (val) => onSubmit!(val),
        controller: controller,
        validator: (String? val) => validator(val),
        keyboardType: type,
        obscureText: obscure,
        enabled: enabled,
        textCapitalization: textCapitalization,
        maxLines: maxLines ?? 1,
        // inputFormatters: [
        //   FilteringTextInputFormatter.digitsOnly,
        // ],
        textAlignVertical: TextAlignVertical.center,
        onChanged:
            onChanged == null ? null : (String value) => onChanged!(value),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            prefix: prefixWidget,
            alignLabelWithHint: alignLabelWithHint,
            // suffix: suffix,
            suffixIcon: suffix,
            contentPadding: const EdgeInsets.only(left: 15, right: 15, top: 25),
            labelText: labelText,
            labelStyle: BaseFonts.body(
              color: BaseColors.labelColor,
            ),
            suffixIconConstraints: suffixIconConstraints,
            focusedBorder: showDecoration
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: BaseColors.subTitleColor,
                    ),
                  )
                : null,
            enabledBorder: showDecoration
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: BaseColors.subTitleColor,
                      width: 1.0,
                    ),
                  )
                : null,
            filled: true,
            fillColor: fillColor ?? BaseColors.textFormFillColor),
      ),
    );
  }
}

class BaseTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final int maxLines;
  final TextEditingController? controller;
  final Function? validator;
  final bool obscureText;
  final TextInputType inputType;

  const BaseTextField(
      {Key? key,
      required this.hintText,
      required this.label,
      this.controller,
      this.obscureText = false,
      this.validator,
      this.inputType = TextInputType.text,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isEmpty
            ? Container()
            : Text(label, style: BaseFonts.headline2(fontSize: 16)),
        verticalSpaceSmall,
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          obscureText: obscureText,
          keyboardType: inputType,
          validator: validator == null
              ? (String? val) {
                  return null;
                }
              : (String? val) => validator!(val),
          decoration: InputDecoration(
            hintText: hintText.isEmpty ? null : hintText,
            hintStyle: BaseFonts.subHead(color: BaseColors.labelColor),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: BaseColors.labelColor),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: BaseColors.redColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: BaseColors.redColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.6, color: BaseColors.labelColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
