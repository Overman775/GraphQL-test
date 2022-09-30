import 'dart:io';

import 'package:artemis/artemis.dart';
import "package:dio/dio.dart";
import 'package:gql/ast.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_websocket_link/gql_websocket_link.dart';

class AppGraphQLArtemisClient {
  late final ArtemisClient client;

  late final DioLink _dioLink;
  late final WebSocketLink _socketLink;

  AppGraphQLArtemisClient(Dio dio) {
    _dioLink = DioLink("http://$_host:8080/graphql", client: dio);

    _socketLink = WebSocketLink(
      'ws://$_host:8080/subscriptions',
      autoReconnect: true,
    );

    final linkRouter = Link.route(_getLink);

    client = ArtemisClient.fromLink(linkRouter);
  }

  String get _host => Platform.isAndroid ? '10.0.2.2' : 'localhost';

  Link _getLink(Request request) {
    final isSubscription = request.operation.document.definitions.any(
      (definition) =>
          definition is OperationDefinitionNode &&
          definition.type == OperationType.subscription,
    );

    return isSubscription ? _socketLink : _dioLink;
  }
}
