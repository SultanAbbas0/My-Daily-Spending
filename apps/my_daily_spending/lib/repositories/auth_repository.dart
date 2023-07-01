import 'package:flutter/material.dart';
import 'package:my_daily_spending/repositories/database_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  static login(String email, String password) async {
    await DataBaseRepository.database.auth
        .signInWithPassword(email: email, password: password)
        .onError((error, stackTrace) {
      debugPrint('error $error');
      return Future.value(AuthResponse());
    });
  }

  static signUp(String email, String password, String username) async {
    await DataBaseRepository.database.auth
        .signUp(email: email, password: password)
        .onError((error, stackTrace) {
      debugPrint('error $error');

      return Future.value(AuthResponse());
    });
    // TODO. make it not put user if user already registered
    await DataBaseRepository.database.from('user').upsert({
      'user_uid': DataBaseRepository.getCurrentUserUID(),
      'username': username
    });
  }
}
