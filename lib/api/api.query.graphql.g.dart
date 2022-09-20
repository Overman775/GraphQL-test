// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'api.query.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Acccounts$Query$Account$Card _$Acccounts$Query$Account$CardFromJson(
        Map<String, dynamic> json) =>
    Acccounts$Query$Account$Card()
      ..id = json['id'] as String?
      ..name = json['name'] as String;

Map<String, dynamic> _$Acccounts$Query$Account$CardToJson(
        Acccounts$Query$Account$Card instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Acccounts$Query$Account _$Acccounts$Query$AccountFromJson(
        Map<String, dynamic> json) =>
    Acccounts$Query$Account()
      ..id = json['id'] as String?
      ..name = json['name'] as String
      ..balance = (json['balance'] as num).toDouble()
      ..cards = (json['cards'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Acccounts$Query$Account$Card.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Acccounts$Query$AccountToJson(
        Acccounts$Query$Account instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'cards': instance.cards?.map((e) => e?.toJson()).toList(),
    };

Acccounts$Query _$Acccounts$QueryFromJson(Map<String, dynamic> json) =>
    Acccounts$Query()
      ..accounts = (json['accounts'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Acccounts$Query$Account.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Acccounts$QueryToJson(Acccounts$Query instance) =>
    <String, dynamic>{
      'accounts': instance.accounts?.map((e) => e?.toJson()).toList(),
    };

Withdraw$Mutation$Account _$Withdraw$Mutation$AccountFromJson(
        Map<String, dynamic> json) =>
    Withdraw$Mutation$Account()
      ..id = json['id'] as String?
      ..balance = (json['balance'] as num).toDouble();

Map<String, dynamic> _$Withdraw$Mutation$AccountToJson(
        Withdraw$Mutation$Account instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
    };

Withdraw$Mutation _$Withdraw$MutationFromJson(Map<String, dynamic> json) =>
    Withdraw$Mutation()
      ..withdraw = json['withdraw'] == null
          ? null
          : Withdraw$Mutation$Account.fromJson(
              json['withdraw'] as Map<String, dynamic>);

Map<String, dynamic> _$Withdraw$MutationToJson(Withdraw$Mutation instance) =>
    <String, dynamic>{
      'withdraw': instance.withdraw?.toJson(),
    };

Withdrawal _$WithdrawalFromJson(Map<String, dynamic> json) => Withdrawal(
      accountId: json['accountId'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$WithdrawalToJson(Withdrawal instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'amount': instance.amount,
    };

AccountBalanceChanged$Subscription$Account
    _$AccountBalanceChanged$Subscription$AccountFromJson(
            Map<String, dynamic> json) =>
        AccountBalanceChanged$Subscription$Account()
          ..id = json['id'] as String?
          ..name = json['name'] as String
          ..balance = (json['balance'] as num).toDouble();

Map<String, dynamic> _$AccountBalanceChanged$Subscription$AccountToJson(
        AccountBalanceChanged$Subscription$Account instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
    };

AccountBalanceChanged$Subscription _$AccountBalanceChanged$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    AccountBalanceChanged$Subscription()
      ..accountBalanceChanged = json['accountBalanceChanged'] == null
          ? null
          : AccountBalanceChanged$Subscription$Account.fromJson(
              json['accountBalanceChanged'] as Map<String, dynamic>);

Map<String, dynamic> _$AccountBalanceChanged$SubscriptionToJson(
        AccountBalanceChanged$Subscription instance) =>
    <String, dynamic>{
      'accountBalanceChanged': instance.accountBalanceChanged?.toJson(),
    };

WithdrawArguments _$WithdrawArgumentsFromJson(Map<String, dynamic> json) =>
    WithdrawArguments(
      withdrawal: json['withdrawal'] == null
          ? null
          : Withdrawal.fromJson(json['withdrawal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WithdrawArgumentsToJson(WithdrawArguments instance) =>
    <String, dynamic>{
      'withdrawal': instance.withdrawal?.toJson(),
    };
