import 'package:easy_localization/easy_localization.dart';
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
    final savingProvider = ref.watch(saving);
    final systemProvider = ref.watch(system);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            TitleContainer(text: 'Dashboard'.tr()),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: BigDoubleCirclesContainer(children: [
                Text(
                  'Daily Balance'.tr(),
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
                ),
              ]),
            ),
            SizedBox(
              height: 7.h,
            ),
            SmallDoubleCirclesContainer(children: [
              Text(
                'Budget'.tr(),
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
              ),
              systemProvider.when(
                data: (data) => Text(data.toString()),
                error: (error, stackTrace) => Container(),
                loading: () => const CircularProgressIndicator(),
              ),
            ]),
            SizedBox(
              height: 7.h,
            ),
            SmallDoubleCirclesContainer(children: [
              Text(
                'Savings'.tr(),
                style: defaultTextStyle.copyWith(fontSize: 25.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              TextFieldContainer(
                height: 20.h,
                width: 100.w,
                withTextField: false,
                child: savingProvider.when(
                  data: (data) => Text(data.toString()),
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => const CircularProgressIndicator(),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
