import 'package:supabase_flutter/supabase_flutter.dart';

class DataBaseRepository {
  static final SupabaseClient database = Supabase.instance.client;

  static String? getCurrentUserUID() {
    return database.auth.currentUser?.id;
  }
}
