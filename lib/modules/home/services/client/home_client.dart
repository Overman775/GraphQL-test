import 'package:app_api/app_api.dart';

abstract class HomeClient {
  Future<List<Accounts$Query$Account>> fetchAccounts();

  Stream<AccountBalanceChanged$Subscription$Account?> streamBalance();

  Future<void> withdraw(String id);
}
