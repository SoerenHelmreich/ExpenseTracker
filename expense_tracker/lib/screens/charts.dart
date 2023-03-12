import 'package:expense_tracker/components/bar%20graph/bar_graph.dart';
import 'package:expense_tracker/components/line_chart.dart';
import 'package:flutter/material.dart';

import '../data/expense_data.dart';

//Test 2
//This is a test comment

class MyCharts extends StatefulWidget {
  const MyCharts({super.key});

  @override
  State<MyCharts> createState() => _MyChartsState();
}

class _MyChartsState extends State<MyCharts> {
  ExpenseData expenses = ExpenseData();

  late List<double> weeklySummary = expenses.getWeekSummary("20230227");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: MyBarGraph(
            weeklySummary: weeklySummary,
          ),
        ),
      ),
    );
  }
}
