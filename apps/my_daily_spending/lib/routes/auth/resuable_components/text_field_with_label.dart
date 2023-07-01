import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_daily_spending/constants.dart';
import 'package:my_daily_spending/reusable_components/text_field_container.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    super.key,
    required this.text,
    required this.textController,
    this.obscureText,
  });
  final String text;
  final TextEditingController textController;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: defaultTextStyle.copyWith(fontSize: 45.sp),
        ),
        SizedBox(
          height: 22.h,
        ),
        TextFieldContainer(
          height: 48.h,
          width: 327.w,
          withTextField: true,
          keyboardType: TextInputType.text,
          obscureText: obscureText ?? false,
          textAlign: TextAlign.start,
          textController: textController,
        )
      ],
    );
  }
}
