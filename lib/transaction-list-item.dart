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
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.purple)),
              width: 100,
              alignment: Alignment.center,
              child: Text(
                _tx.amount.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _tx.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                _tx.date.toString(),
                style: TextStyle(color: Colors.blueGrey),
              )
            ],
          )
        ],
      )),
    );
  }
}
