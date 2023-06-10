import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_daily_spending/constants.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      width: 288.w,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 52.w, top: 31.h),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: borderRadius(250.r),
      ),
      child: Text(
        text,
        style: titleTextStyle,
      ),
    );
  }
}
