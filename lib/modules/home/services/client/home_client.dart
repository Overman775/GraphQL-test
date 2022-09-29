import '../../models/account.dart';
import '../../models/account_subscription.dart';

abstract class HomeClient {
  Future<List<Account>> fetchAccounts();

  Stream<AccountSubscription?> streamBalance();

  Future<void> withdraw(String id);
}
