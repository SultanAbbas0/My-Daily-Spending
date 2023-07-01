import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_daily_spending/providers/providers.dart';
import 'package:my_daily_spending/routes/auth/login_screen.dart';
import 'package:my_daily_spending/routes/auth/signup_screen.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final loginState = ref.watch(loginScreen);
    return loginState == true ? const LoginScreen() : const SignupScreen();
  }
}
