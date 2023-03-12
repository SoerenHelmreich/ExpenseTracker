import 'package:expense_tracker/components/bar%20graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;

  const MyBarGraph({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      monAmount: weeklySummary[0],
      tueAmount: weeklySummary[1],
      wedAmount: weeklySummary[2],
      thurAmount: weeklySummary[3],
      friAmount: weeklySummary[4],
      satAmount: weeklySummary[5],
      sunAmount: weeklySummary[6],
    );
    myBarData.initializeBarData();

    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData: FlGridData(show: false),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.position,
                barRods: [
                  BarChartRodData(
                      toY: data.height,
                      color: Colors.amber[200],
                      width: 25,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 100,
                        color: Colors.grey[200],
                      ))
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
