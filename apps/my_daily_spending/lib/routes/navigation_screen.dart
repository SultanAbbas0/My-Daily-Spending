import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_daily_spending/constants.dart';
import 'package:my_daily_spending/providers/providers.dart';
import 'package:my_daily_spending/routes/dashboard/dashboard_screen.dart';
import 'package:my_daily_spending/routes/deduct/deduct_screen.dart';
import 'package:my_daily_spending/routes/set_balance/set_balance_screen.dart';
import 'package:my_daily_spending/routes/settings/settings_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigationScreen extends ConsumerWidget {
  const NavigationScreen({super.key});

  static List<Widget> screens = [
    const DashboardScreen(),
    const SetBalanceScreen(),
    const DeductScreen(),
    const SettingsScreen(),
  ];

  static List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.dashboard),
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.grey,
      textStyle: defaultTextStyle,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.attach_money),
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.grey,
      textStyle: defaultTextStyle,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.money),
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.grey,
      textStyle: defaultTextStyle,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.settings),
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.grey,
      textStyle: defaultTextStyle,
    ),
  ];

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(localization);

    return PersistentTabView(
      context,
      key: UniqueKey(),
      controller: PersistentTabController(initialIndex: ref.read(navBarIndex)),
      backgroundColor: Colors.blueGrey,
      navBarStyle: NavBarStyle.style9,
      screens: screens,
      onItemSelected: (value) => ref.read(navBarIndex.notifier).state = value,
      items: items,
    );
  }
}
