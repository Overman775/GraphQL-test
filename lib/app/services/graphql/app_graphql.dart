import "package:dio/dio.dart";
import "package:gql_dio_link/gql_dio_link.dart";
import "package:gql_link/gql_link.dart";

class AppGraphQLLink {
  final Dio dio;

  AppGraphQLLink(this.dio);

  Link init() {
    return DioLink("/graphql", client: dio);
  }
}
