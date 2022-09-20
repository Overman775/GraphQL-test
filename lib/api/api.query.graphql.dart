// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'api.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Acccounts$Query$Account$Card extends JsonSerializable
    with EquatableMixin {
  Acccounts$Query$Account$Card();

  factory Acccounts$Query$Account$Card.fromJson(Map<String, dynamic> json) =>
      _$Acccounts$Query$Account$CardFromJson(json);

  String? id;

  late String name;

  @override
  List<Object?> get props => [id, name];
  @override
  Map<String, dynamic> toJson() => _$Acccounts$Query$Account$CardToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Acccounts$Query$Account extends JsonSerializable with EquatableMixin {
  Acccounts$Query$Account();

  factory Acccounts$Query$Account.fromJson(Map<String, dynamic> json) =>
      _$Acccounts$Query$AccountFromJson(json);

  String? id;

  late String name;

  late double balance;

  List<Acccounts$Query$Account$Card?>? cards;

  @override
  List<Object?> get props => [id, name, balance, cards];
  @override
  Map<String, dynamic> toJson() => _$Acccounts$Query$AccountToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Acccounts$Query extends JsonSerializable with EquatableMixin {
  Acccounts$Query();

  factory Acccounts$Query.fromJson(Map<String, dynamic> json) =>
      _$Acccounts$QueryFromJson(json);

  List<Acccounts$Query$Account?>? accounts;

  @override
  List<Object?> get props => [accounts];
  @override
  Map<String, dynamic> toJson() => _$Acccounts$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Withdraw$Mutation$Account extends JsonSerializable with EquatableMixin {
  Withdraw$Mutation$Account();

  factory Withdraw$Mutation$Account.fromJson(Map<String, dynamic> json) =>
      _$Withdraw$Mutation$AccountFromJson(json);

  String? id;

  late double balance;

  @override
  List<Object?> get props => [id, balance];
  @override
  Map<String, dynamic> toJson() => _$Withdraw$Mutation$AccountToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Withdraw$Mutation extends JsonSerializable with EquatableMixin {
  Withdraw$Mutation();

  factory Withdraw$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Withdraw$MutationFromJson(json);

  Withdraw$Mutation$Account? withdraw;

  @override
  List<Object?> get props => [withdraw];
  @override
  Map<String, dynamic> toJson() => _$Withdraw$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Withdrawal extends JsonSerializable with EquatableMixin {
  Withdrawal({
    required this.accountId,
    required this.amount,
  });

  factory Withdrawal.fromJson(Map<String, dynamic> json) =>
      _$WithdrawalFromJson(json);

  late String accountId;

  late double amount;

  @override
  List<Object?> get props => [accountId, amount];
  @override
  Map<String, dynamic> toJson() => _$WithdrawalToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AccountBalanceChanged$Subscription$Account extends JsonSerializable
    with EquatableMixin {
  AccountBalanceChanged$Subscription$Account();

  factory AccountBalanceChanged$Subscription$Account.fromJson(
          Map<String, dynamic> json) =>
      _$AccountBalanceChanged$Subscription$AccountFromJson(json);

  String? id;

  late String name;

  late double balance;

  @override
  List<Object?> get props => [id, name, balance];
  @override
  Map<String, dynamic> toJson() =>
      _$AccountBalanceChanged$Subscription$AccountToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AccountBalanceChanged$Subscription extends JsonSerializable
    with EquatableMixin {
  AccountBalanceChanged$Subscription();

  factory AccountBalanceChanged$Subscription.fromJson(
          Map<String, dynamic> json) =>
      _$AccountBalanceChanged$SubscriptionFromJson(json);

  AccountBalanceChanged$Subscription$Account? accountBalanceChanged;

  @override
  List<Object?> get props => [accountBalanceChanged];
  @override
  Map<String, dynamic> toJson() =>
      _$AccountBalanceChanged$SubscriptionToJson(this);
}

final ACCCOUNTS_QUERY_DOCUMENT_OPERATION_NAME = 'Acccounts';
final ACCCOUNTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Acccounts'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'accounts'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'balance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cards'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class AcccountsQuery extends GraphQLQuery<Acccounts$Query, JsonSerializable> {
  AcccountsQuery();

  @override
  final DocumentNode document = ACCCOUNTS_QUERY_DOCUMENT;

  @override
  final String operationName = ACCCOUNTS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  Acccounts$Query parse(Map<String, dynamic> json) =>
      Acccounts$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class WithdrawArguments extends JsonSerializable with EquatableMixin {
  WithdrawArguments({this.withdrawal});

  @override
  factory WithdrawArguments.fromJson(Map<String, dynamic> json) =>
      _$WithdrawArgumentsFromJson(json);

  final Withdrawal? withdrawal;

  @override
  List<Object?> get props => [withdrawal];
  @override
  Map<String, dynamic> toJson() => _$WithdrawArgumentsToJson(this);
}

final WITHDRAW_MUTATION_DOCUMENT_OPERATION_NAME = 'withdraw';
final WITHDRAW_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'withdraw'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'withdrawal')),
        type: NamedTypeNode(
          name: NameNode(value: 'Withdrawal'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'withdraw'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'withdrawal'),
            value: VariableNode(name: NameNode(value: 'withdrawal')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'balance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class WithdrawMutation
    extends GraphQLQuery<Withdraw$Mutation, WithdrawArguments> {
  WithdrawMutation({required this.variables});

  @override
  final DocumentNode document = WITHDRAW_MUTATION_DOCUMENT;

  @override
  final String operationName = WITHDRAW_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final WithdrawArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Withdraw$Mutation parse(Map<String, dynamic> json) =>
      Withdraw$Mutation.fromJson(json);
}

final ACCOUNT_BALANCE_CHANGED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME =
    'AccountBalanceChanged';
final ACCOUNT_BALANCE_CHANGED_SUBSCRIPTION_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'AccountBalanceChanged'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'accountBalanceChanged'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'accountId'),
            value: StringValueNode(
              value: '00000000-0000-0000-0000-000000000000',
              isBlock: false,
            ),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'balance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class AccountBalanceChangedSubscription
    extends GraphQLQuery<AccountBalanceChanged$Subscription, JsonSerializable> {
  AccountBalanceChangedSubscription();

  @override
  final DocumentNode document = ACCOUNT_BALANCE_CHANGED_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName =
      ACCOUNT_BALANCE_CHANGED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  AccountBalanceChanged$Subscription parse(Map<String, dynamic> json) =>
      AccountBalanceChanged$Subscription.fromJson(json);
}
