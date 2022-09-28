import 'package:flutter/widgets.dart';
import 'package:graphql_test_pos/modules/home/presentation/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'data/repositories/home_repository.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeRepositoryGraphQL>(
          create: (context) => HomeRepositoryGraphQL(context.read()),
        ),
      ],
      child: HomePage(
        repository: HomeRepositoryGraphQL(context.read()),
      ),
    );
  }
}
