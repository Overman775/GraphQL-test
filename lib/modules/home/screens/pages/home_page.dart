import 'package:flutter/material.dart';

import '../../models/account.dart';
import '../../models/account_subscription.dart';
import '../../services/client/home_client.dart';

class HomePage extends StatefulWidget {
  final HomeClient repository;

  const HomePage({
    Key? key,
    required this.repository,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Account> accounts = [];

  @override
  void initState() {
    _updateAccounts();
    super.initState();
  }

  void _updateAccounts() async {
    final result = await widget.repository.fetchAccounts();
    setState(() {
      accounts = result;
    });
  }

  void _withdraw(String? id) {
    if (id != null) {
      widget.repository.withdraw(id);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: StreamBuilder<AccountSubscription?>(
            stream: widget.repository.streamBalance(),
            builder: (BuildContext context,
                AsyncSnapshot<AccountSubscription?> snapshot) {
              final accountBalance = snapshot.data?.balance;

              if (accountBalance != null) {
                return Text('Balance: $accountBalance');
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
        body: ListView.builder(
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
              trailing: IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: () {
                  _withdraw(accounts[index].id);
                },
              ),
            );
          },
        ),
      );
}
