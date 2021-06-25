import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction-form.dart';
import './transaction-list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  List<Transaction> transactions = [
    Transaction('id1', "bag", 11.11, DateTime.now()),
    Transaction('id2', "shoe", 33, DateTime.now()),
    Transaction('id3', "gas", 200, DateTime.now()),
    Transaction('id4', "computer", 10000, DateTime.now()),
  ];
  void _onSubmit(title, amount) {
    String txId = 'id${this.transactions.length + 1}';
    setState(() {
      this.transactions.add(Transaction(txId, title, amount, DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TransactionForm(_onSubmit), TransactionList(transactions)],
    );
  }
}
