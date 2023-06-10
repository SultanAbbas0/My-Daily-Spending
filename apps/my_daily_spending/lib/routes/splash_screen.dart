import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_daily_spending/routes/navigation_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<ConsumerStatefulWidget> {
  bool _redirectCalled = false;
  bool isLoggedIn = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (_redirectCalled || !mounted) {
      return;
    }

    _redirectCalled = true;
    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NavigationScreen(),
    );
  }
}
