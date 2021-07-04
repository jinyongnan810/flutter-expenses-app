import 'package:flutter/material.dart';
import '../models/chart.dart';

class ChartBar extends StatelessWidget {
  final OneDayAmount oneDayAmount;
  ChartBar(this.oneDayAmount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$${oneDayAmount.amount.toStringAsFixed(0)}')),
        Container(
          width: 10,
          height: 100,
          child: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3),
                          topRight: Radius.circular(3)))),
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: 10,
                    height: 100 * oneDayAmount.percentage,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3),
                            topRight: Radius.circular(3)))),
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
