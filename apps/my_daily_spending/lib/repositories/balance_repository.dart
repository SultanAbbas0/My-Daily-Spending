import 'package:my_daily_spending/repositories/database_repository.dart';

class BalanceRepository {
  static updateBalance(double amount) async {
    final data = {
      'user_uid': DataBaseRepository.getCurrentUserUID(),
      'daily_amount': amount,
      'balance': amount
    };
    await DataBaseRepository.database.from('balance').upsert(data);
  }

  static deductBalance(double deduction) async {
    final oldBalance = await DataBaseRepository.database
        .from('balance')
        .select()
        .eq('user_uid', DataBaseRepository.getCurrentUserUID());

    final data = {
      'user_uid': DataBaseRepository.getCurrentUserUID(),
      'balance': oldBalance.first['balance'] - deduction
    };
    await DataBaseRepository.database.from('balance').upsert(data);
  }

  static addToBalance(double amount) async {
    final oldSaving = await DataBaseRepository.database
        .from('balance')
        .select()
        .eq('user_uid', DataBaseRepository.getCurrentUserUID());

    final data = {
      'user_uid': DataBaseRepository.getCurrentUserUID(),
      'balance': oldSaving.first['balance'] + amount
    };

    await DataBaseRepository.database.from('balance').upsert(data);
  }

  static getBalance() async {
    final data = await DataBaseRepository.database
        .from('balance')
        .select()
        .eq('user_uid', DataBaseRepository.getCurrentUserUID());
    if (data.isEmpty) {
      return 0;
    }
    return data.first['balance'];
  }

  static updateSystem(String system) async {
    final data = {
      'user_uid': DataBaseRepository.getCurrentUserUID(),
      'system': system
    };
    await DataBaseRepository.database.from('balance').upsert(data);
  }

  static getSystem() async {
    final data = await DataBaseRepository.database
        .from('balance')
        .select()
        .eq('user_uid', DataBaseRepository.getCurrentUserUID());
    if (data.isEmpty) {
      return '';
    }
    return data.first['system'];
  }
}
