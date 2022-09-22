import 'dart:io';

import 'package:artemis/artemis.dart';
import "package:dio/dio.dart";
import "package:gql_dio_link/gql_dio_link.dart";
import "package:gql_link/gql_link.dart";
import 'package:gql_websocket_link/gql_websocket_link.dart';

class AppGQLClient {
  final Dio dio;

  AppGQLClient(this.dio);

  String get _host => Platform.isAndroid ? '10.0.2.2' : 'localhost';

  ArtemisClient init() {
    return ArtemisClient.fromLink(
      Link.from([
        DioLink("http://$_host:8080/graphql", client: dio),
        WebSocketLink('ws://$_host:8080/subscriptions', autoReconnect: true),
      ]),
    );
  }
}
