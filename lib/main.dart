import 'package:flutter/material.dart';
import './widgets/transaction-form.dart';
import './widgets/transaction-list.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

// MyApp should be seperate with MyHomePage to avoid unexpected error
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Personal Expenses',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void startAddingTransactions(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (BuildContext _) {
          return TransactionForm(_onSubmit);
        });
  }

  List<Transaction> transactions = [
    Transaction('id1', "bag", 11.11, DateTime.now()),
    Transaction('id2', "shoe", 33, DateTime.now()),
    Transaction('id3', "gas", 200, DateTime.now()),
    Transaction('id4', "computer", 1000, DateTime.now()),
  ];
  void _onSubmit(title, amount) {
    String txId = 'id${this.transactions.length + 1}';
    setState(() {
      this.transactions.add(Transaction(txId, title, amount, DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: [
          IconButton(
              onPressed: () => startAddingTransactions(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                child: Card(
                  child: Text('chart'),
                  elevation: 5,
                )),
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddingTransactions(context),
      ),
    );
  }
}
