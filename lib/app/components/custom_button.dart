import 'package:flutter/material.dart';
import 'package:online_course/app/utils/style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color? color;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? radius;
  final double? textSize;
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    this.color,
    this.textColor,
    this.textStyle,
    this.radius,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 50),
        ),
      ),
      onPressed: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Text(
        text,
        style: textStyle ??
            textTitle(color: textColor ?? Colors.white, size: textSize ?? 14),
      ),
    );
  }
}
