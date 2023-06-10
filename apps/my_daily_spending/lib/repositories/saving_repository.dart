import 'package:my_daily_spending/repositories/database_repository.dart';

class SavingRepository {
  static updateSaving(double saving) async {
    final data = {
      'user_uid': DataBaseRepository.currentUserUid,
      'saving': saving
    };
    await DataBaseRepository.database.from('saving').upsert(data);
  }

  static getSaving() async {
    final data = await DataBaseRepository.database
        .from('saving')
        .select()
        .eq('user_uid', DataBaseRepository.currentUserUid);

    return data.first['saving'];
  }
}
