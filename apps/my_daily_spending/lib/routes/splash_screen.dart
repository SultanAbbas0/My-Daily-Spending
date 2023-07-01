import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_daily_spending/providers/providers.dart';
import 'package:my_daily_spending/routes/landing_screen.dart';
import 'package:my_daily_spending/routes/navigation_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(currentUser);
    return user == null ? const LandingScreen() : const NavigationScreen();
  }
}
