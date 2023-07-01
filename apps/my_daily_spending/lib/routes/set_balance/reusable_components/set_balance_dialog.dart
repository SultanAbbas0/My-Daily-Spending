import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_daily_spending/constants.dart';
import 'package:my_daily_spending/providers/providers.dart';
import 'package:my_daily_spending/repositories/balance_repository.dart';
import 'package:my_daily_spending/repositories/budget_repository.dart';
import 'package:my_daily_spending/reusable_components/cancel_button.dart';
import 'package:my_daily_spending/reusable_components/continue_button.dart';
import 'package:my_daily_spending/reusable_components/loading_dialog.dart';
import 'package:my_daily_spending/reusable_components/text_field_container.dart';

showSetBalanceDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final textController = TextEditingController();

            return Dialog(
              elevation: 0,
              backgroundColor: Colors.blue,
              insetPadding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                padding: EdgeInsets.only(top: 21.h),
                height: 134.h,
                width: 284.w,
                decoration: BoxDecoration(
                  borderRadius: borderRadius(30.r),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daily Balance'.tr(),
                          style: defaultTextStyle.copyWith(fontSize: 13.sp),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFieldContainer(
                          height: 36.h,
                          width: 236.w,
                          withTextField: true,
                          textController: textController,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CancelButton(
                              text: 'Cancel'.tr(),
                              height: 30.h,
                              width: 100.w,
                              fontSize: 15.sp,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            ContinueButton(
                              text: 'Confirm'.tr(),
                              onTap: () async {
                                if (textController.value.text.isEmpty) {
                                  return;
                                }
                                showloadingDialog(context);
                                await BalanceRepository.updateBalance(
                                    double.parse(textController.value.text));
                                ref.invalidate(balance);
                                await BalanceRepository.updateSystem(
                                    'Manually');
                                ref.invalidate(system);
                                await BudgetRepository.updateBudget(0);
                                ref.invalidate(budget);
                                if (context.mounted) {
                                  Navigator.of(context, rootNavigator: true)
                                    ..pop()
                                    ..pop();
                                }
                              },
                              height: 30.h,
                              width: 100.w,
                              fontSize: 15.sp,
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            );
          },
        );
      });
}
