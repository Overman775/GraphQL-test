import 'dart:io';

import 'package:artemis/artemis.dart';
import "package:dio/dio.dart";
import "package:gql_dio_link/gql_dio_link.dart";

class AppGQLClient {
  final Dio dio;

  AppGQLClient(this.dio);

  String get _host => Platform.isAndroid ? '10.0.2.2' : 'localhost';

  ArtemisClient init() {
    return ArtemisClient.fromLink(
      DioLink("http://$_host:8080/graphql", client: dio),
    );
  }
}
