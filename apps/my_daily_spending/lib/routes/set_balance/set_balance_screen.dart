import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_daily_spending/reusable_components/title_container.dart';
import 'package:my_daily_spending/routes/set_balance/reusable_components/set_budget_dialog.dart';
import 'package:my_daily_spending/routes/set_balance/reusable_components/double_ellipse_container.dart';

import 'package:my_daily_spending/routes/set_balance/reusable_components/set_balance_dialog.dart';

class SetBalanceScreen extends ConsumerWidget {
  const SetBalanceScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            TitleContainer(
              text: 'Set Daily Balance'.tr(),
            ),
            SizedBox(
              height: 55.h,
            ),
            DoubleEllipseContainer(
              text: 'Manually'.tr(),
              onTap: (context) => showSetBalanceDialog(context),
            ),
            DoubleEllipseContainer(
                text: 'Weekly system'.tr(),
                onTap: (context) => showSetBudgetDialog(context, 1)),
            DoubleEllipseContainer(
                text: 'Monthly system'.tr(),
                onTap: (context) => showSetBudgetDialog(context, 2)),
            DoubleEllipseContainer(
                text: 'Yearly system'.tr(),
                onTap: (context) => showSetBudgetDialog(context, 3)),
          ],
        ),
      ),
    );
  }
}
