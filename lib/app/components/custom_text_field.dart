import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool? filled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? radius;
  final Color? hintStyleColor;
  final bool? readOnly;
  final Function? onTap;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final int? maxLines;
  final int? maxLength;
  final Function? onSubmitted;
  final Function? onChanged;
  final Function? onEditingComplete;
  final Color? backgroundColor;
  final Color? cursorColor;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.hintStyle,
    this.filled,
    this.prefixIcon,
    this.suffixIcon,
    this.radius,
    this.hintStyleColor,
    this.readOnly,
    this.onTap,
    this.keyboardType,
    this.autofocus,
    this.maxLines,
    this.maxLength,
    this.onSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.backgroundColor,
    this.cursorColor,
    this.style,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 10),
        color: backgroundColor ?? Get.theme.scaffoldBackgroundColor,
      ),
      child: Center(
        child: TextField(
          textInputAction: textInputAction ?? TextInputAction.done,
          style: style ?? Get.textTheme.bodyText1,
          controller: controller,
          onChanged: (value) {
            if (onChanged != null) onChanged!();
          },
          onSubmitted: (value) {
            if (onSubmitted != null) onSubmitted!();
          },
          onEditingComplete: () {
            if (onEditingComplete != null) onEditingComplete!();
          },
          cursorColor: cursorColor ?? Get.theme.primaryColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: hintText ?? '',
            hintStyle: TextStyle(color: hintStyleColor ?? Colors.grey),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          keyboardType: keyboardType ?? TextInputType.text,
          readOnly: readOnly ?? false,
          maxLines: maxLines,
          onTap: () {
            if (onTap != null) onTap!();
          },
          maxLength: maxLength,
        ),
      ),
    );
  }
}
