import 'package:meta/meta.dart';

import 'card.dart';

@immutable
class Account {
  const Account({
    this.id,
    required this.name,
    required this.balance,
    required this.cards,
  });

  final String? id;

  final String name;

  final double balance;

  final List<Card> cards;
}
