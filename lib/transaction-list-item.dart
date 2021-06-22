import 'package:flutter/material.dart';
import './transaction.dart';

class TransactionListItem extends StatelessWidget {
  Transaction _tx;
  TransactionListItem(this._tx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: Row(
        children: [
          Container(child: Text(_tx.amount.toString())),
          Column(
            children: [Text(_tx.title), Text(_tx.date.toString())],
          )
        ],
      )),
    );
  }
}
