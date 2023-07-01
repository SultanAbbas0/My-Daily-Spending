import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_daily_spending/constants.dart';
import 'package:my_daily_spending/providers/providers.dart';
import 'package:my_daily_spending/repositories/balance_repository.dart';
import 'package:my_daily_spending/repositories/saving_repository.dart';
import 'package:my_daily_spending/reusable_components/continue_button.dart';
import 'package:my_daily_spending/reusable_components/loading_dialog.dart';
import 'package:my_daily_spending/reusable_components/text_field_container.dart';
import 'package:my_daily_spending/routes/deduct/reusable_components/undo_button.dart';

class BigContainer extends HookConsumerWidget {
  const BigContainer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final TextEditingController balanceDeductTextController =
        useTextEditingController();
    final TextEditingController savingDeductTextController =
        useTextEditingController();
    return Expanded(
      child: Container(
        //margin: EdgeInsets.only(left: 40.w),
        width: 260.w,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(3, 59, 156, 0.25),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(children: [
          SizedBox(height: 10.h),
          Text(
            'Deduct from\nbalance'.tr(),
            textAlign: TextAlign.center,
            style: defaultTextStyle.copyWith(fontSize: 30.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
          TextFieldContainer(
            height: 30,
            width: 250,
            withTextField: true,
            textController: balanceDeductTextController,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UndoButton(
                text: 'Undo'.tr(),
                height: 30.h,
                width: 100.w,
                fontSize: 15.sp,
                onTap: () async {
                  showloadingDialog(context);
                  await BalanceRepository.addToBalance(
                      ref.read(balanceDeduction));
                  if (context.mounted) {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
                  ref.read(balanceDeduction.notifier).state = 0;

                  ref.invalidate(balance);
                },
              ),
              SizedBox(
                width: 5.w,
              ),
              ContinueButton(
                text: 'Submit'.tr(),
                height: 30.h,
                width: 100.w,
                fontSize: 15.sp,
                onTap: () async {
                  if (balanceDeductTextController.text.isEmpty) {
                    return;
                  }
                  showloadingDialog(context);
                  ref.read(balanceDeduction.notifier).state =
                      double.parse(balanceDeductTextController.text);
                  await BalanceRepository.deductBalance(
                      double.parse(balanceDeductTextController.text));
                  if (context.mounted) {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
                  ref.invalidate(balance);
                },
              )
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'Deduct from\nsavings'.tr(),
            textAlign: TextAlign.center,
            style: defaultTextStyle.copyWith(fontSize: 30.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
          TextFieldContainer(
            height: 30,
            width: 250,
            withTextField: true,
            textController: savingDeductTextController,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UndoButton(
                text: 'Undo'.tr(),
                height: 30.h,
                width: 100.w,
                fontSize: 15.sp,
                onTap: () async {
                  showloadingDialog(context);
                  await SavingRepository.addToSaving(ref.read(savingDeduction));
                  if (context.mounted) {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
                  ref.read(savingDeduction.notifier).state = 0;
                  ref.invalidate(saving);
                },
              ),
              SizedBox(
                width: 5.w,
              ),
              ContinueButton(
                text: 'Submit'.tr(),
                height: 30.h,
                width: 100.w,
                fontSize: 15.sp,
                onTap: () async {
                  if (savingDeductTextController.text.isEmpty) {
                    return;
                  }
                  showloadingDialog(context);
                  ref.read(savingDeduction.notifier).state =
                      double.parse(savingDeductTextController.text);
                  await SavingRepository.deductSaving(
                      double.parse(savingDeductTextController.text));
                  if (context.mounted) {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
                  ref.invalidate(saving);
                },
              )
            ],
          ),
        ]),
      ),
    );
  }
}
