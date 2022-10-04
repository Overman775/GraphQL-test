import 'dart:io';

import 'package:artemis/artemis.dart';
import "package:dio/dio.dart";
import 'package:gql/ast.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_websocket_link/gql_websocket_link.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AppGraphQLArtemisClient {
  late final ArtemisClient client;

  late final DioLink _dioLink;
  late final WebSocketLink _socketLink;

  AppGraphQLArtemisClient(Dio dio) {
    _dioLink = DioLink("http://$_host:8080/graphql", client: dio);

    _socketLink = WebSocketLink(
      null,
      autoReconnect: true,
      reconnectInterval: const Duration(seconds: 1),
      channelGenerator: _generateWebSocketChannel,
    );

    final linkServer = Link.split(
        (request) => _isSubscription(request), _socketLink, _dioLink);

    client = ArtemisClient.fromLink(linkServer);
  }

  String get _host => Platform.isAndroid ? '10.0.2.2' : 'localhost';

  WebSocketChannel _generateWebSocketChannel() {
    return WebSocketChannel.connect(Uri.parse('ws://$_host:8080/subscriptions'),
        protocols: ['graphql-ws']);
  }

  bool _isSubscription(Request request) {
    final definitions = request.operation.document.definitions
        .whereType<OperationDefinitionNode>()
        .toList();

    if (request.operation.operationName != null) {
      definitions.removeWhere(
        (node) => node.name?.value != request.operation.operationName,
      );
    }

    assert(definitions.length == 1);
    return definitions.first.type == OperationType.subscription;
  }
}
