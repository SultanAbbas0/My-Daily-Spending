import 'package:my_daily_spending/repositories/database_repository.dart';

class BudgetRepository {
  static updateBudget(double budget) async {
    final data = {
      'user_uid': DataBaseRepository.currentUserUid,
      'budget': budget
    };
    await DataBaseRepository.database.from('budget').upsert(data);
  }

  static getBudget() async {
    final data = await DataBaseRepository.database
        .from('budget')
        .select()
        .eq('user_uid', DataBaseRepository.currentUserUid);

    return data.first['budget'];
  }
}
