import 'package:my_daily_spending/repositories/database_repository.dart';

class SavingRepository {
  static addToSaving(double saving) async {
    final oldSaving = await DataBaseRepository.database
        .from('saving')
        .select()
        .eq('user_uid', DataBaseRepository.getCurrentUserUID());

    final data = {
      'user_uid': DataBaseRepository.getCurrentUserUID(),
      'saving': saving + (oldSaving.isEmpty ? 0 : oldSaving.first['saving'])
    };

    await DataBaseRepository.database.from('saving').upsert(data);
  }

  static getSaving() async {
    final List data = await DataBaseRepository.database
        .from('saving')
        .select()
        .eq('user_uid', DataBaseRepository.getCurrentUserUID());
    if (data.isEmpty) {
      return 0;
    }
    return data.first['saving'];
  }

  static deductSaving(double deduction) async {
    final oldSaving = await DataBaseRepository.database
        .from('saving')
        .select()
        .eq('user_uid', DataBaseRepository.getCurrentUserUID());

    final data = {
      'user_uid': DataBaseRepository.getCurrentUserUID(),
      'saving': oldSaving.first['saving'] - deduction
    };
    await DataBaseRepository.database.from('saving').upsert(data);
  }
}
