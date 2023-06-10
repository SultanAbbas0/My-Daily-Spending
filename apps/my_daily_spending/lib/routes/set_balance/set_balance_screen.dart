import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_daily_spending/reusable_components/title_container.dart';
import 'package:my_daily_spending/routes/set_balance/reusable_components/set_budget_dialog.dart';
import 'package:my_daily_spending/routes/set_balance/reusable_components/double_ellipse_container.dart';

import 'package:my_daily_spending/routes/set_balance/reusable_components/set_balance_dialog.dart';

class SetBalanceScreen extends StatelessWidget {
  const SetBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleContainer(
            text: 'Set Daily Balance',
          ),
          SizedBox(
            height: 55.h,
          ),
          DoubleEllipseContainer(
            text: 'Manually',
            onTap: (context) => showSetBalanceDialog(context),
          ),
          DoubleEllipseContainer(
              text: 'Weekly system',
              onTap: (context) => showSetBudgetDialog(context, 1)),
          DoubleEllipseContainer(
              text: 'Monthly system',
              onTap: (context) => showSetBudgetDialog(context, 2)),
          DoubleEllipseContainer(
              text: 'Yearly system ',
              onTap: (context) => showSetBudgetDialog(context, 3)),
        ],
      ),
    );
  }
}
