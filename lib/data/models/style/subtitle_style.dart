import 'package:flutter/material.dart';
import 'package:subtitle_wrapper_package/data/models/style/subtitle_border_style.dart';
import 'package:subtitle_wrapper_package/data/models/style/subtitle_position.dart';

class SubtitleStyle {
  final bool hasBorder;
  final SubtitleBorderStyle borderStyle;
  final double fontSize;
  final Color textColor;
  final SubtitlePosition position;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final List<Shadow> shadows;
  final TextStyle textStyle;

  const SubtitleStyle(
      {this.hasBorder = false,
      this.borderStyle = const SubtitleBorderStyle(),
      this.fontSize = 16,
      this.textColor = Colors.black,
      this.position = const SubtitlePosition(),
      this.backgroundColor = Colors.transparent,
      this.padding = EdgeInsets.zero,
      this.shadows,
      this.textStyle});
}
