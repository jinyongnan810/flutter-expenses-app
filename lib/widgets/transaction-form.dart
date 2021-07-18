import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

// A stateful widget makes data and ui seperate with each other
// this prevents the inputs in the form being cleared when ui re-evaluates
class TransactionForm extends StatefulWidget {
  final _onSubmit;
  TransactionForm(this._onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final isIOS = true; //defaultTargetPlatform == TargetPlatform.iOS;
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  DateTime? date;

  void submitData() {
    try {
      final title = titleControler.text;
      final amount = double.parse(amountControler.text);
      if (title.isEmpty || amount <= 0) {
        return;
      }
      widget._onSubmit(title, amount, date ?? DateTime.now());
      titleControler.clear();
      amountControler.clear();
      date = null;
      // close modal sheet
      Navigator.of(context).pop();
    } catch (error) {
      print('error:$error');
    }
  }

  void presentDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now());
    if (pickedDate == null) {
      return;
    }
    setState(() {
      date = pickedDate;
    });
    TimeOfDay? pickedTime = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 8, minute: 0));
    if (pickedTime == null) {
      return;
    }
    setState(() {
      date = new DateTime(pickedDate.year, pickedDate.month, pickedDate.day,
          pickedTime.hour, pickedTime.minute, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
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
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(date == null
                        ? 'No Date Choosen(Today)'
                        : DateFormat('yyyy-MM-dd hh:mm:ss').format(date!)),
                    isIOS
                        // ios button changes opacity when clicked
                        ? CupertinoButton(
                            onPressed: presentDatePicker,
                            child: Text('Choose Date'))
                        : TextButton(
                            onPressed: presentDatePicker,
                            child: Text('Choose Date'))
                  ],
                ),
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
      ),
    );
  }
}
