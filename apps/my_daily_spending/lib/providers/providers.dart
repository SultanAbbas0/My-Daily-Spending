import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_daily_spending/repositories/balance_repository.dart';
import 'package:my_daily_spending/repositories/budget_repository.dart';
import 'package:my_daily_spending/repositories/database_repository.dart';
import 'package:my_daily_spending/repositories/saving_repository.dart';
import 'package:my_daily_spending/repositories/user_repository.dart';

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

final saving = FutureProvider((ref) {
  return SavingRepository.getSaving();
});

final system = FutureProvider((ref) async {
  return BalanceRepository.getSystem();
});

final balanceDeduction = StateProvider<double>((ref) {
  return 0;
});
final savingDeduction = StateProvider<double>((ref) {
  return 0;
});
final currentUser = Provider((ref) {
  return DataBaseRepository.database.auth.currentUser;
});

final loginScreen = StateProvider((ref) {
  return true;
});

final username = FutureProvider.autoDispose((ref) {
  return UserRepository.getUsername();
});

final localization = StateProvider((ref) {
  return 'en';
});

final navBarIndex = StateProvider((ref) {
  return 0;
});
