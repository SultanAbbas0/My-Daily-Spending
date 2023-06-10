import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_daily_spending/constants.dart';
import 'package:my_daily_spending/providers/providers.dart';
import 'package:my_daily_spending/reusable_components/text_field_container.dart';
import 'package:my_daily_spending/reusable_components/title_container.dart';
import 'package:my_daily_spending/routes/dashboard/reusable_components/double_circles_container.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final balanceProvider = ref.watch(balance);
    final budgetProvider = ref.watch(budget);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleContainer(text: 'Dashboard'),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 52.w),
            child: BigDoubleCirclesContainer(children: [
              Text(
                'Daily Balance',
                style: defaultTextStyle.copyWith(fontSize: 25.sp),
              ),
              SizedBox(
                height: 49.h,
              ),
              TextFieldContainer(
                height: 36.h,
                width: 183.w,
                withTextField: false,
                child: balanceProvider.when(
                  data: (data) => Text(data.toString()),
                  error: (error, stackTrace) => Container(),
                  loading: () => const CircularProgressIndicator(),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 101.w),
            child: SmallDoubleCirclesContainer(children: [
              Text(
                'Budget',
                style: defaultTextStyle.copyWith(fontSize: 25.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              TextFieldContainer(
                height: 20.h,
                width: 100.w,
                withTextField: false,
                child: budgetProvider.when(
                  data: (data) => Text(data.toString()),
                  error: (error, stackTrace) => Container(),
                  loading: () => const CircularProgressIndicator(),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 101.w),
            child: SmallDoubleCirclesContainer(children: [
              Text(
                'Savings',
                style: defaultTextStyle.copyWith(fontSize: 25.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              TextFieldContainer(
                height: 20.h,
                width: 100.w,
                withTextField: false,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
