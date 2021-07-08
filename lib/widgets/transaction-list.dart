import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction-list-item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  void Function(String) _onDelete;
  TransactionList(this._transactions, this._onDelete);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child:
            // ListView Usage 1
            // ListView(
            //   children: [..._transactions.map((t) => TransactionListItem(t))],
            // ),
            // ListView Usage 2
            // this way of using ListView will lazy load the items & destroy the not displayed ones
            // saves memory and imporves performance
            _transactions.isEmpty
                ? Column(
                    children: [
                      Text("No transactions yet!"),
                      // use as seperator
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                        height: 200,
                      ))
                    ],
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) {
                      return TransactionListItem(
                          _transactions[index], _onDelete);
                    },
                    itemCount: _transactions.length,
                  ));
  }
}
