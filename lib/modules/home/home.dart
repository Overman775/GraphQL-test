import 'package:flutter/widgets.dart';
import 'package:graphql_test_pos/modules/home/view/home_page.dart';
import 'package:provider/provider.dart';

import 'data/home_repository.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeRepository>(
          create: (context) => HomeRepository(context.read()),
        ),
      ],
      child: HomePage(
        repository: HomeRepository(context.read()),
      ),
    );
  }
}
