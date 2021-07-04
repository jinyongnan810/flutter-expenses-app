import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction _tx;
  TransactionListItem(this._tx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 50,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                '\$ ${_tx.amount.toStringAsFixed(1)}',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
        title: Text(_tx.title, style: Theme.of(context).textTheme.headline6),
        subtitle: Text(
          DateFormat('yyyy-MM-dd hh:mm:ss').format(_tx.date),
          style: TextStyle(color: Colors.blueGrey),
        ),
      ),
    );
  }
}
