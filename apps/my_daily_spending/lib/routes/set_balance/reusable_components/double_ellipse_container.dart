import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_daily_spending/constants.dart';

class DoubleEllipseContainer extends StatelessWidget {
  const DoubleEllipseContainer(
      {super.key, required this.text, required this.onTap});
  final String text;
  final void Function(BuildContext) onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 86.h),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Ellipse(color: Color.fromRGBO(3, 59, 156, 0.15)),
            PositionedDirectional(
              top: 10.h,
              child: const Ellipse(
                color: Color.fromRGBO(123, 116, 99, 0.141),
              ),
            ),
            PositionedDirectional(
              bottom: 18.h,
              start: -3.w,
              child: const Dot(),
            ),
            PositionedDirectional(
              bottom: 13.h,
              start: 15.w,
              child: Text(
                text,
                style: defaultTextStyle.copyWith(fontSize: 20.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Ellipse extends StatelessWidget {
  const Ellipse({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius(250.r),
        color: color,
      ),
      height: 63.h,
      width: 310.w,
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      height: 10.h,
      width: 10.w,
    );
  }
}
