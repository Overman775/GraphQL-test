import 'package:app_api/app_api.dart';

import '../../../../app/services/graphql/app_graphql.dart';
import 'home_client.dart';

class HomeGraphQLClient implements HomeClient {
  final AppGQLClient appGQLClient;

  HomeGraphQLClient(this.appGQLClient);

  @override
  Future<List<Accounts$Query$Account>> fetchAccounts() async {
    final result = await appGQLClient.client.execute(AccountsQuery());

    return result.data?.accounts
            ?.whereType<Accounts$Query$Account>()
            .toList() ??
        [];
  }

  @override
  Stream<AccountBalanceChanged$Subscription$Account?> streamBalance() {
    return appGQLClient.socket
        .stream(AccountBalanceChangedSubscription())
        .map((event) => event.data?.accountBalanceChanged);
  }

  @override
  Future<void> withdraw(String id) async {
    final args =
        WithdrawArguments(withdrawal: Withdrawal(accountId: id, amount: 100));

    await appGQLClient.client.execute(WithdrawMutation(variables: args));
  }
}
