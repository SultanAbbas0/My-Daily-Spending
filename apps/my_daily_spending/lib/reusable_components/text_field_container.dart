import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_daily_spending/constants.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    super.key,
    required this.height,
    required this.width,
    required this.withTextField,
    this.textController,
    this.child,
    this.onChanged,
  });
  final double height;
  final double width;
  final bool withTextField;
  final TextEditingController? textController;
  final Widget? child;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: borderRadius(300.r)),
      child: withTextField
          ? TextField(
              controller: withTextField ? textController : null,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
              ),
              style: textFieldTextStyle,
              onChanged: (value) {
                onChanged?.call(value);
              },
            )
          : child,
    );
  }
}
