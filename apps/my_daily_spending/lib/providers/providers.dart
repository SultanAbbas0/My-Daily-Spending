import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_daily_spending/repositories/balance_repository.dart';
import 'package:my_daily_spending/repositories/budget_repository.dart';

final balance = FutureProvider((ref) {
  return BalanceRepository.getBalance();
});

final budget = FutureProvider((ref) async {
  return BudgetRepository.getBudget();
});

// budget stored locally
final localBudget = StateProvider<double>((ref) {
  return 0;
});

final savingAmount = StateProvider.autoDispose<double>((ref) {
  return 0;
});
