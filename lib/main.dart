import 'package:flutter/material.dart';
import './transaction.dart';
import './transaction-list-item.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Transaction> transactions = [
    Transaction('id1', "bag", 11.11, DateTime.now()),
    Transaction('id2', "shoe", 33, DateTime.now()),
    Transaction('id3', "gas", 200, DateTime.now()),
    Transaction('id4', "computer", 10000, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Personal Expenses',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Personal Expenses'),
          ),
          body: Column(
            children: [
              Container(
                  width: double.infinity,
                  child: Card(
                    child: Text('chart'),
                    elevation: 5,
                  )),
              Column(
                children: [...transactions.map((t) => TransactionListItem(t))],
              )
            ],
          ),
        ));
  }
}
