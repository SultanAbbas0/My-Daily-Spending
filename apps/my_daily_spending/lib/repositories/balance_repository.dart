import 'package:my_daily_spending/repositories/database_repository.dart';

class BalanceRepository {
  static updateBalance(double balance) async {
    final data = {
      'user_uid': DataBaseRepository.currentUserUid,
      'balance': balance
    };
    await DataBaseRepository.database.from('balance').upsert(data);
  }

  static getBalance() async {
    final data = await DataBaseRepository.database
        .from('balance')
        .select()
        .eq('user_uid', DataBaseRepository.currentUserUid);

    return data.first['balance'];
  }
}
