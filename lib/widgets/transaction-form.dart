import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  final _onSubmit;
  TransactionForm(this._onSubmit);
  @override
  Widget build(BuildContext context) {
    return Card(
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
                  onPressed: () {
                    _onSubmit(titleControler.text,
                        double.parse(amountControler.text));
                    titleControler.clear();
                    amountControler.clear();
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
                  ),
                  child: Text('Submit')),
            )
          ],
        ),
      ),
    );
  }
}
