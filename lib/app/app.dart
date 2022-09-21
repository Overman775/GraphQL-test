import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gql_link/gql_link.dart';
import 'package:provider/provider.dart';

import '../modules/home/home_page.dart';
import 'services/dio/app_dio.dart';
import 'services/graphql/app_graphql.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(
          create: (_) => AppDio().init(),
        ),
        Provider<Link>(
          create: (context) => AppGraphQLLink(context.read()).init(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
