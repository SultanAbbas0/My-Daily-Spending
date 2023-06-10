import 'package:flutter/material.dart';
import 'package:my_daily_spending/constants.dart';
import 'package:my_daily_spending/routes/dashboard/dashboard_screen.dart';
import 'package:my_daily_spending/routes/deduct/deduct_screen.dart';
import 'package:my_daily_spending/routes/set_balance/set_balance_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  static List<Widget> screens = [
    const DashboardScreen(),
    const SetBalanceScreen(),
    const DeductScreen(),
    const Center(child: Text('Settings'))
  ];

  static List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.dashboard),
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.grey,
      title: 'Dashboard',
      textStyle: defaultTextStyle,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.attach_money),
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.grey,
      title: 'Set balance',
      textStyle: defaultTextStyle,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.money),
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.grey,
      title: 'Deduct',
      textStyle: defaultTextStyle,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.settings),
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.grey,
      title: 'Settings',
      textStyle: defaultTextStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      backgroundColor: Colors.blueGrey,
      navBarStyle: NavBarStyle.style9,
      screens: screens,
      items: items,
    );
  }
}
