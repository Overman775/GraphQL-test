import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../api/api.query.graphql.dart';
import '../data/home_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeRepository repository;

  List<Accounts$Query$Account> accounts = [];

  @override
  void didChangeDependencies() {
    repository = HomeRepository(context.read());
    _updateAccounts();
    super.didChangeDependencies();
  }

  void _updateAccounts() async {
    final result = await repository.fetchAccounts();
    setState(() {
      accounts = result;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (BuildContext context, int index) {
              final account = accounts[index];
              return ListTile(
                title: Text(account.name),
                subtitle: Column(
                  children: [
                    for (final card in accounts[index].cards) Text(card.name)
                  ],
                ),
              );
            },
          ),
        ),
      );
}
