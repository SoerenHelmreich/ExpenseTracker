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
    IndividualBar(position: 0, height: monAmount);
    IndividualBar(position: 0, height: tueAmount);
    IndividualBar(position: 0, height: wedAmount);
    IndividualBar(position: 0, height: thurAmount);
    IndividualBar(position: 0, height: friAmount);
    IndividualBar(position: 0, height: satAmount);
    IndividualBar(position: 0, height: sunAmount);
  }
}
