import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromRGBO(6, 17, 48, 1), Color.fromRGBO(21, 42, 61, 1)],
        ),
      ),
      child: child,
    );
  }
}
