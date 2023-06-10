import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_daily_spending/constants.dart';
import 'package:my_daily_spending/providers/providers.dart';
import 'package:my_daily_spending/repositories/balance_repository.dart';
import 'package:my_daily_spending/repositories/budget_repository.dart';
import 'package:my_daily_spending/reusable_components/cancel_button.dart';
import 'package:my_daily_spending/reusable_components/continue_button.dart';
import 'package:my_daily_spending/reusable_components/text_field_container.dart';

showSetBudgetDialog(BuildContext context, int index) {
  showDialog(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final budgetTextController = TextEditingController();
            final savingAmountTextController = TextEditingController();
            final savingPercentageTextController = TextEditingController();
            updateBalance(double newBalance) async {
              await BalanceRepository.updateBalance(newBalance);
              ref.invalidate(balance);
            }

            return Dialog(
              backgroundColor: Colors.blue,
              insetPadding: const EdgeInsets.symmetric(horizontal: 130),
              child: Container(
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: borderRadius(30.r),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Budget',
                    style: defaultTextStyle.copyWith(fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFieldContainer(
                    height: 20.h,
                    width: 112.w,
                    withTextField: true,
                    textController: budgetTextController,
                    onChanged: (_) {
                      if (budgetTextController.text.isEmpty) {
                        ref.read(localBudget.notifier).state = 0;
                        savingAmountTextController.text = '';
                        savingPercentageTextController.text = '';
                      } else if (savingAmountTextController.text.isNotEmpty ||
                          savingPercentageTextController.text.isNotEmpty) {
                        ref.read(localBudget.notifier).state =
                            double.parse(budgetTextController.text);
                        savingAmountTextController.text = '';
                        savingPercentageTextController.text = '';
                      } else {
                        ref.read(localBudget.notifier).state =
                            double.parse(budgetTextController.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Text(
                    'Saving',
                    style: defaultTextStyle.copyWith(fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomColumn(
                        text: 'amount',
                        textController: savingAmountTextController,
                        onChanged: (_) {
                          if (savingAmountTextController.text.isNotEmpty &&
                              ref.read(localBudget) != 0) {
                            savingPercentageTextController
                                .text = ((double.parse(
                                            savingAmountTextController.text) /
                                        ref.read(localBudget)) *
                                    100)
                                .toString();
                          } else {
                            savingPercentageTextController.text = '';
                          }
                        },
                      ),
                      SizedBox(
                        width: 19.w,
                      ),
                      CustomColumn(
                        text: 'percentage',
                        textController: savingPercentageTextController,
                        onChanged: (_) {
                          if (savingPercentageTextController.text.isNotEmpty &&
                              ref.read(localBudget) != 0) {
                            savingAmountTextController
                                .text = (double.parse(((double.parse(
                                                savingPercentageTextController
                                                    .text) /
                                            100)
                                        .toString())) *
                                    ref.read(localBudget))
                                .toString();
                          } else {
                            savingAmountTextController.text = '';
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CancelButton(
                        text: 'Cancel',
                        height: 25.h,
                        width: 60.w,
                        fontSize: 13.sp,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      ContinueButton(
                        text: 'Confirm',
                        onTap: () async {
                          if (budgetTextController.value.text.isEmpty) {
                            return;
                          }
                          await BudgetRepository.updateBudget(
                              double.parse(budgetTextController.value.text));
                          ref.invalidate(budget);
                          switch (index) {
                            case 1:
                              {
                                await updateBalance(double.parse(
                                        budgetTextController.value.text) /
                                    7);
                              }
                              break;
                            case 2:
                              {
                                await updateBalance(double.parse(
                                        budgetTextController.value.text) /
                                    30);
                              }
                              break;
                            case 3:
                              {
                                await updateBalance(double.parse(
                                        budgetTextController.value.text) /
                                    365);
                              }
                              break;
                          }
                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }
                        },
                        height: 25.h,
                        width: 60.w,
                        fontSize: 13.sp,
                      ),
                    ],
                  )
                ]),
              ),
            );
          },
        );
      });
}

class CustomColumn extends StatelessWidget {
  const CustomColumn({
    super.key,
    required this.text,
    required this.textController,
    required this.onChanged,
  });
  final String text;
  final TextEditingController textController;

  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        text,
        style: defaultTextStyle.copyWith(color: Colors.black, fontSize: 8.sp),
      ),
      TextFieldContainer(
        height: 20.h,
        width: 45.w,
        withTextField: true,
        textController: textController,
        onChanged: onChanged,
      ),
    ]);
  }
}
