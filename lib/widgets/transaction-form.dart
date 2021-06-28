import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  final _onSubmit;
  void submitData() {
    try {
      final title = titleControler.text;
      final amount = double.parse(amountControler.text);
      if (title.isEmpty || amount <= 0) {
        return;
      }
      _onSubmit(title, amount);
      titleControler.clear();
      amountControler.clear();
    } catch (error) {
      print('error:$error');
    }
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              style: TextStyle(fontSize: 18),
              controller: amountControler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: OutlinedButton(
                  onPressed: submitData,
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
