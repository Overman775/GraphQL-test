import 'package:artemis/client.dart';

import '../../../api/api.query.graphql.dart';

class HomeRepository {
  final ArtemisClient client;

  HomeRepository(this.client);

  Future<List<Accounts$Query$Account>> fetchAccounts() async {
    final result = await client.execute(AccountsQuery());

    if (result.hasErrors) {
      throw Exception(result.errors);
    }

    return result.data?.accounts ?? [];
  }
}
