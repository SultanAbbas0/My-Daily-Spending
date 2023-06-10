import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_daily_spending/app.dart';
import 'package:my_daily_spending/auth/secrets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //TODO. can't share this on gitHub
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
  await Supabase.instance.client.auth.signInWithPassword(
      email: 'sultanabbas018@gmail.com', password: '123456');
  runApp(const ProviderScope(child: MyApp()));
}
