import 'package:flutter/material.dart';
import 'package:my_daily_spending/constants.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton(
      {super.key,
      required this.text,
      this.onTap,
      required this.height,
      required this.width,
      required this.fontSize});
  final String text;
  final Function? onTap;
  final double height;
  final double width;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green[300],
          borderRadius: borderRadius(4),
        ),
        height: height,
        width: width,
        child: Text(
          text,
          style: defaultTextStyle.copyWith(fontSize: fontSize),
        ),
      ),
    );
  }
}
