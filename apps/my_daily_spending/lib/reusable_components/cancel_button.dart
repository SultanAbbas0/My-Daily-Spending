import 'package:flutter/material.dart';
import 'package:my_daily_spending/constants.dart';

class CancelButton extends StatelessWidget {
  const CancelButton(
      {super.key,
      required this.text,
      required this.height,
      required this.width,
      required this.fontSize});
  final String text;
  final double height;
  final double width;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
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
