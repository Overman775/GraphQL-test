import 'package:app_artemis_api/app_api.dart';
import 'package:graphql_test_pos/modules/home/models/account.dart';

import '../../../../app/services/graphql/app_graphql.dart';
import '../../models/account_subscription.dart';
import 'home_client.dart';
import 'home_graphql_artemis_mapper.dart';

class HomeGraphQLArtemisClient implements HomeClient {
  final AppGraphQLArtemisClient appGQLClient;

  HomeGraphQLArtemisClient(this.appGQLClient);

  @override
  Future<List<Account>> fetchAccounts() async {
    final result = await appGQLClient.client.execute(AccountsQuery());

    return result.data?.accounts
            ?.whereType<Accounts$Query$Account>()
            .map(HomeGraphQLArtemisMapper.account)
            .toList() ??
        [];
  }

  @override
  Stream<AccountSubscription?> streamBalance() {
    return appGQLClient.socket.stream(AccountBalanceChangedSubscription()).map(
        (event) => HomeGraphQLArtemisMapper.accountSubscription(
            event.data?.accountBalanceChanged));
  }

  @override
  Future<void> withdraw(String id) async {
    final args =
        WithdrawArguments(withdrawal: Withdrawal(accountId: id, amount: 100));

    await appGQLClient.client.execute(WithdrawMutation(variables: args));
  }
}
