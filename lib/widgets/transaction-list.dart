import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction-list-item.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> _transactions;
  TransactionList(this._transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [..._transactions.map((t) => TransactionListItem(t))],
        ),
      ),
    );
  }
}
