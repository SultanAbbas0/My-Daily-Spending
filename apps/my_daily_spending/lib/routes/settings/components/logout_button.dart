import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_daily_spending/constants.dart';
import 'package:my_daily_spending/providers/providers.dart';
import 'package:my_daily_spending/repositories/database_repository.dart';
import 'package:my_daily_spending/reusable_components/loading_dialog.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
        onTap: () async {
          showloadingDialog(context);
          await DataBaseRepository.database.auth.signOut();
          if (context.mounted) {
            Navigator.of(context, rootNavigator: true).pop();
            context.setLocale(const Locale('en', 'US'));
          }

          final List<dynamic> providers = [
            balance,
            budget,
            localBudget,
            saving,
            system,
            balanceDeduction,
            savingDeduction,
            currentUser,
            loginScreen,
            localization,
            navBarIndex
          ];
          for (var i = 0; i < providers.length; i++) {
            ref.invalidate(providers[i]);
          }
        },
        child: Container(
          //margin: EdgeInsets.only(left: 70.w),
          alignment: Alignment.center,
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              borderRadius: borderRadius(5), color: Colors.red[600]),
          child: Text(
            'Logout'.tr(),
            style: defaultTextStyle.copyWith(fontSize: 30),
          ),
        ));
  }
}
