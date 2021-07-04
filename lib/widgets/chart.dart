import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chartbar.dart';
import '../models/transaction.dart';
import '../models/chart.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  OneWeekAmount get recentWeekAmount {
    DateTime now = DateTime.now();
    // get total amount
    double total = recentTransactions.fold(
        0, (previousValue, element) => previousValue + element.amount);
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

      return total == 0
          ? OneDayAmount(DateFormat.E().format(targetDay), 0, 0)
          : OneDayAmount(
              DateFormat.E().format(targetDay), dayAmount, dayAmount / total);
    });
    return OneWeekAmount(total, daily);
  }

  Chart(this.recentTransactions);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...recentWeekAmount.daily
                  // .map((e) => Flexible(fit: FlexFit.tight, child: ChartBar(e))) // the same with Expanded
                  .map((e) => Expanded(child: ChartBar(e)))
            ],
          ),
        ));
  }
}
