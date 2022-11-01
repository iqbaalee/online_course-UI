import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomInputPassword extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool? filled;
  final Widget? prefixIcon;
  final double? radius;
  final Color? hintStyleColor;
  final bool? readOnly;
  final Function? onTap;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final int? maxLength;
  final Function? onSubmitted;
  final Function? onChanged;
  final Function? onEditingComplete;
  final bool? typePassword;
  const CustomInputPassword({
    super.key,
    required this.controller,
    this.hintText,
    this.hintStyle,
    this.filled,
    this.prefixIcon,
    this.radius,
    this.hintStyleColor,
    this.readOnly,
    this.onTap,
    this.keyboardType,
    this.autofocus,
    this.maxLength,
    this.onSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.typePassword,
  });

  @override
  State<CustomInputPassword> createState() => _CustomInputPasswordState();
}

class _CustomInputPasswordState extends State<CustomInputPassword> {
  var showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius ?? 10),
        color: Get.theme.scaffoldBackgroundColor,
      ),
      child: TextField(
        obscureText: showPassword,
        controller: widget.controller,
        onSubmitted: (value) {
          if (widget.onSubmitted != null) widget.onSubmitted!();
        },
        onChanged: (value) {
          if (value == '') {
            setState(() {});
          }
        },
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: widget.hintText ?? '',
          hintStyle: TextStyle(color: widget.hintStyleColor ?? Colors.grey),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: IconButton(
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
          ),
        ),
        keyboardType: widget.keyboardType ?? TextInputType.text,
        readOnly: widget.readOnly ?? false,
        onTap: () {
          if (widget.onTap != null) widget.onTap!();
        },
        maxLength: widget.maxLength,
      ),
    );
  }
}
