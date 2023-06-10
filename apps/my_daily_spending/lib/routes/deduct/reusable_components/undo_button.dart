import 'package:flutter/material.dart';
import 'package:my_daily_spending/constants.dart';

class UndoButton extends StatelessWidget {
  const UndoButton(
      {super.key,
      required this.text,
      required this.height,
      required this.width,
      required this.fontSize,
      this.onTap});
  final String text;
  final double height;
  final double width;
  final double fontSize;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.red[300],
          borderRadius: borderRadius(4),
        ),
        child: Text(
          text,
          style: defaultTextStyle.copyWith(fontSize: fontSize),
        ),
      ),
    );
  }
}
