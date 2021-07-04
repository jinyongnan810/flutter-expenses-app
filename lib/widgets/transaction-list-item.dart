import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction _tx;
  TransactionListItem(this._tx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor)),
              width: 100,
              alignment: Alignment.center,
              child: FittedBox(
                child: Text(
                  '\$ ${_tx.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor),
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                  child: Text(_tx.title,
                      style: Theme.of(context).textTheme.headline6)),
              Text(
                DateFormat('yyyy-MM-dd hh:mm:ss').format(_tx.date),
                style: TextStyle(color: Colors.blueGrey),
              )
            ],
          )
        ],
      )),
    );
  }
}
