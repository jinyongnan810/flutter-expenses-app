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
    DateTime now = DateTime.now();
    int todayWeekDay = now.weekday;
    // get total amount
    final aWeekAgo = DateTime(now.year, now.month, now.day - 6);
    double total = recentTransactions
        .where((t) => t.date.isAfter(aWeekAgo))
        .fold(0, (previousValue, element) => previousValue + element.amount);
    // get each day amount
    List<OneDayAmount> daily = List.generate(7, (index) {
      // example: today: Tuesday 7/8
      // then count from Wed 7/2 to Tue 7/8
      final targetDay = DateTime(now.year, now.month, now.day - 6 + index);
      final targetNextDay =
          DateTime(now.year, now.month, now.day - 6 + index + 1);
      double dayAmount = recentTransactions
          .where((t) =>
              t.date.isAfter(targetDay) && t.date.isBefore(targetNextDay))
          .fold(0, (previousValue, element) => previousValue + element.amount);
      int customIndex = todayWeekDay + index;
      if (customIndex > 6) customIndex -= 7;
      return total == 0
          ? OneDayAmount(weekDays[customIndex], 0, 0)
          : OneDayAmount(weekDays[customIndex], dayAmount, dayAmount / total);
    });
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
                    Text('${(e.percentage * 100).toStringAsFixed(2)}%'),
                    Text(e.day)
                  ],
                ))
          ],
        ));
  }
}
