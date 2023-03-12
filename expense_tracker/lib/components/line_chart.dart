import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyLineChart extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  //const MyLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 7,
          minY: 0,
          gridData: FlGridData(show: false),
          maxY: 1000,
          titlesData: FlTitlesData(
            show: true,
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: bottomTitleWidgets,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: leftTitleWidgets,
                reservedSize: 42,
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              isStrokeCapRound: true,
              isCurved: true,
              barWidth: 3,
              gradient: LinearGradient(
                  colors: gradientColors, transform: GradientRotation(pi / 2)),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                    colors: gradientColors
                        .map((color) => color.withOpacity(0.4))
                        .toList(),
                    transform: GradientRotation(pi / 2)),
              ),
              spots: [
                FlSpot(0, 300),
                FlSpot(2, 200),
                FlSpot(4, 500),
                FlSpot(7, 600)
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text('Mon', style: style);
      break;
    case 3:
      text = const Text('Wed', style: style);
      break;
    case 5:
      text = const Text('Fri', style: style);
      break;
    case 7:
      text = const Text('Sun', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '10K';
      break;
    case 3:
      text = '30k';
      break;
    case 5:
      text = '50k';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}
