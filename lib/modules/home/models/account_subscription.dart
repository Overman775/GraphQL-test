import 'package:meta/meta.dart';

@immutable
class AccountSubscription {
  const AccountSubscription({
    this.id,
    required this.name,
    required this.balance,
  });

  final String? id;

  final String name;

  final double balance;
}
