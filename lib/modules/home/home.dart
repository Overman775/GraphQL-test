import 'package:flutter/widgets.dart';
import 'package:graphql_test_pos/modules/home/screens/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'services/client/home_client.dart';
import 'services/client/home_graphql_client.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeClient>(
          create: (context) => HomeGraphQLClient(context.read()),
        ),
      ],
      child: HomePage(
        repository: context.read(),
      ),
    );
  }
}
