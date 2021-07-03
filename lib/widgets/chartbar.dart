import 'package:flutter/material.dart';
import '../models/chart.dart';

class ChartBar extends StatelessWidget {
  final OneDayAmount oneDayAmount;
  ChartBar(this.oneDayAmount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('\$ ${oneDayAmount.amount.toStringAsFixed(2)}'),
        Text('${(oneDayAmount.percentage * 100).toStringAsFixed(2)}%'),
        Text(oneDayAmount.day)
      ],
    );
  }
}
