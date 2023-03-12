import 'package:expense_tracker/components/bar%20graph/individual_graph.dart';

class BarData {
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;
  final double sunAmount;

  BarData({
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
    required this.sunAmount,
  });

  List<IndividualBar> barData = [];

  //initialize bar data
  void initializeBarData() {
    barData = [
      IndividualBar(position: 0, height: monAmount),
      IndividualBar(position: 1, height: tueAmount),
      IndividualBar(position: 2, height: wedAmount),
      IndividualBar(position: 3, height: thurAmount),
      IndividualBar(position: 4, height: friAmount),
      IndividualBar(position: 5, height: satAmount),
      IndividualBar(position: 6, height: sunAmount),
    ];
  }
}
