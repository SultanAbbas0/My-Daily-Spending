import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_daily_spending/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:my_daily_spending/providers/providers.dart';

class LocalizationButton extends ConsumerWidget {
  const LocalizationButton(
      {super.key, required this.text, required this.locale});
  final String text;
  final Locale locale;
  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        context.setLocale(locale);
        ref.read(localization.notifier).state = text.toLowerCase();
      },
      child: Container(
        alignment: Alignment.center,
        height: 63.h,
        width: 121.w,
        decoration: BoxDecoration(
          borderRadius: borderRadius(250.r),
          color: const Color.fromRGBO(3, 59, 156, 0.15),
        ),
        child: Text(
          text,
          style: defaultTextStyle.copyWith(fontSize: 30.sp),
        ),
      ),
    );
  }
}
