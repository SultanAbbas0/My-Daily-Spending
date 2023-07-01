import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_daily_spending/reusable_components/title_container.dart';
import 'package:my_daily_spending/routes/deduct/components/big_container.dart';

class DeductScreen extends StatelessWidget {
  const DeductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(children: [
          TitleContainer(text: 'Deduct'.tr()),
          SizedBox(
            height: 28.h,
          ),
          const BigContainer()
        ]),
      ),
    );
  }
}
