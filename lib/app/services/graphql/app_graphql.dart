import 'dart:io';

import 'package:artemis/artemis.dart';
import "package:dio/dio.dart";
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:gql_websocket_link/gql_websocket_link.dart';

class AppGQLClient {
  late final ArtemisClient client;
  late final ArtemisClient socket;

  AppGQLClient(Dio dio) {
    final dioLink = DioLink("http://$_host:8080/graphql", client: dio);

    client = ArtemisClient.fromLink(dioLink);

    final socketLink = WebSocketLink(
      'ws://$_host:8080/subscriptions',
      autoReconnect: true,
    );

    socket = ArtemisClient.fromLink(socketLink);
  }

  String get _host => Platform.isAndroid ? '10.0.2.2' : 'localhost';
}
