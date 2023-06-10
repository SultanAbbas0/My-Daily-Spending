import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigDoubleCirclesContainer extends StatelessWidget {
  const BigDoubleCirclesContainer({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Circle(
            height: 287.h,
            width: 288.w,
            color: const Color.fromRGBO(3, 59, 156, 0.15)),
        Positioned(
          bottom: 5.h,
          right: 17.w,
          child: Circle(
            height: 287.h,
            width: 288.w,
            color: const Color.fromRGBO(123, 116, 99, 0.141),
          ),
        ),
        Positioned(
          left: 45.w,
          top: 75.h,
          child: Column(
            children: children,
          ),
        )
      ],
    );
  }
}

class SmallDoubleCirclesContainer extends StatelessWidget {
  const SmallDoubleCirclesContainer({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Circle(
            height: 172.h,
            width: 173.w,
            color: const Color.fromRGBO(3, 59, 156, 0.15)),
        Positioned(
          bottom: 5.h,
          right: 9.w,
          child: Circle(
            height: 172.h,
            width: 173.w,
            color: const Color.fromRGBO(123, 116, 99, 0.141),
          ),
        ),
        Positioned(
          left: 31.w,
          top: 45.h,
          child: Column(
            children: children,
          ),
        )
      ],
    );
  }
}

class Circle extends StatelessWidget {
  const Circle(
      {super.key,
      required this.color,
      required this.height,
      required this.width});
  final Color? color;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
