import '../../../api/api.query.graphql.dart';
import '../../../app/services/graphql/app_graphql.dart';

class HomeRepository {
  final AppGQLClient appGQLClient;

  HomeRepository(this.appGQLClient);

  Future<List<Accounts$Query$Account>> fetchAccounts() async {
    final result = await appGQLClient.client.execute(AccountsQuery());

    if (result.hasErrors) {
      throw Exception(result.errors);
    }

    return result.data?.accounts
            ?.whereType<Accounts$Query$Account>()
            .toList() ??
        [];
  }

  Stream<AccountBalanceChanged$Subscription$Account?> streamBalance() {
    return appGQLClient.socket
        .stream(AccountBalanceChangedSubscription())
        .map((event) => event.data?.accountBalanceChanged);
  }

  Future<void> withdraw(String id) async {
    final args =
        WithdrawArguments(withdrawal: Withdrawal(accountId: id, amount: 100));

    await appGQLClient.client.execute(WithdrawMutation(variables: args));
  }
}
