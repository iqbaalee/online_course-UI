import 'package:flutter/material.dart';

TextStyle textTitle({
  double? size = 14,
  Color? color,
  FontWeight? fontWeight = FontWeight.bold,
  FontStyle? fontStyle = FontStyle.normal,
  double? heightText = 1.2,
}) =>
    TextStyle(
      fontSize: size,
      color: color ?? Colors.black,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontFamily: 'Poppins',
      height: heightText ?? 0,
      letterSpacing: 1,
    );

TextStyle textSubtitle({
  double? size = 14,
  Color? color,
  FontWeight? fontWeight = FontWeight.bold,
  FontStyle? fontStyle = FontStyle.normal,
  double? heightText = 0,
}) =>
    TextStyle(
      fontSize: size,
      color: color ?? Colors.black,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontFamily: 'Poppins',
      height: heightText ?? 0,
      letterSpacing: .2,
    );

TextStyle textScaffold({
  double? size = 14,
  double? height,
  Color? color,
  FontWeight? fontWeight = FontWeight.bold,
  FontStyle? fontStyle = FontStyle.normal,
}) =>
    TextStyle(
      fontSize: size,
      color: color ?? Colors.black,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontFamily: 'Poppins',
      height: height ?? 1.5,
    );
