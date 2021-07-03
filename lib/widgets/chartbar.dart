import 'package:flutter/material.dart';
import '../models/chart.dart';

class ChartBar extends StatelessWidget {
  final OneDayAmount oneDayAmount;
  ChartBar(this.oneDayAmount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('\$${oneDayAmount.amount.toStringAsFixed(2)}'),
        Container(
          width: 10,
          height: 100,
          child: Stack(
            children: [
              Container(
                color: Colors.amber,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 10,
                  height: 100 * oneDayAmount.percentage,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        ),
        // Text('${(oneDayAmount.percentage * 100).toStringAsFixed(2)}%'),
        Text(oneDayAmount.day)
      ],
    );
  }
}
