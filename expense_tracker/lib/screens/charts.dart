import 'package:expense_tracker/components/bar%20graph/bar_graph.dart';
import 'package:expense_tracker/components/line_chart.dart';
import 'package:flutter/material.dart';

class MyCharts extends StatefulWidget {
  const MyCharts({super.key});

  @override
  State<MyCharts> createState() => _MyChartsState();
}

class _MyChartsState extends State<MyCharts> {
  List<double> weeklySummary = [
    20.00,
    10.20,
    5.30,
    15.23,
    12.99,
    15.00,
    3.20,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          child: MyBarGraph(
            weeklySummary: weeklySummary,
          ),
        ),
      ),
    );
  }
}
