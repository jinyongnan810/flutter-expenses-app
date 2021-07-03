import 'package:flutter/material.dart';
import '../models/transaction.dart';

class OneDayAmount {
  final String day;
  final double amount;
  final double percentage;
  OneDayAmount(this.day, this.amount, this.percentage);
}

class OneWeekAmount {
  final double total;
  final List<OneDayAmount> daily;
  OneWeekAmount(this.total, this.daily);
}

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  final List<String> weekDays = [
    'Mon',
    'Tue',
    "Wen",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];
  OneWeekAmount get recentWeekAmount {
    double total = recentTransactions.fold(
        0, (previousValue, element) => previousValue + element.amount);
    if (total == 0) {
      total = 100;
    }
    List<OneDayAmount> daily = List.generate(
        7, (index) => OneDayAmount(weekDays[index], 11.22, 11.22 / 100));
    return OneWeekAmount(total, daily);
  }

  Chart(this.recentTransactions);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            ...recentWeekAmount.daily.map((e) => Column(
                  children: [
                    Text('\$ ${e.amount.toStringAsFixed(2)}'),
                    Text('${e.percentage.toStringAsFixed(2)}%'),
                    Text(e.day)
                  ],
                ))
          ],
        ));
  }
}
