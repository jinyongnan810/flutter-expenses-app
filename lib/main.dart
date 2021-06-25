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
  List<Transaction> transactions = [
    Transaction('id1', "bag", 11.11, DateTime.now()),
    Transaction('id2', "shoe", 33, DateTime.now()),
    Transaction('id3', "gas", 200, DateTime.now()),
    Transaction('id4', "computer", 10000, DateTime.now()),
  ];
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  void _onSubmit() {
    String txId = 'id${this.transactions.length + 1}';
    setState(() {
      this.transactions.add(Transaction(txId, titleControler.text,
          double.parse(amountControler.text), DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Personal Expenses',
        theme: ThemeData(
          primarySwatch: Colors.purple,
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
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        style: TextStyle(fontSize: 18),
                        controller: titleControler,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        style: TextStyle(fontSize: 18),
                        controller: amountControler,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: OutlinedButton(
                            onPressed: _onSubmit,
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15)),
                            ),
                            child: Text('Submit')),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [...transactions.map((t) => TransactionListItem(t))],
              )
            ],
          ),
        ));
  }
}
