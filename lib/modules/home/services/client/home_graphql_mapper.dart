import 'package:app_api/app_api.dart';
import 'package:graphql_test_pos/modules/home/models/account.dart';
import 'package:graphql_test_pos/modules/home/models/account_subscription.dart';
import 'package:graphql_test_pos/modules/home/models/card.dart';

class HomeGraphQLMapper {
  static Account account(Accounts$Query$Account dto) {
    return Account(
      id: dto.id,
      name: dto.name,
      balance: dto.balance,
      cards: dto.cards
              ?.whereType<Accounts$Query$Account$Card>()
              .map(card)
              .toList() ??
          [],
    );
  }

  static AccountSubscription? accountSubscription(
      AccountBalanceChanged$Subscription$Account? dto) {
    if (dto == null) {
      return null;
    }

    return AccountSubscription(
      id: dto.id,
      name: dto.name,
      balance: dto.balance,
    );
  }

  static Card card(Accounts$Query$Account$Card dto) {
    return Card(
      id: dto.id,
      name: dto.name,
    );
  }
}
