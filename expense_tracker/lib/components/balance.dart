import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyBalance extends StatelessWidget {
  final double totalBalance;
  final double totalIncome;
  final double totalExpense;

  const MyBalance(
      {super.key,
      required this.totalBalance,
      required this.totalExpense,
      required this.totalIncome});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amberAccent[100],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("B A L A N C E",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Text(
                NumberFormat.simpleCurrency(locale: 'de-DE', decimalDigits: 2)
                    .format(totalBalance),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text("Income"),
                          Text(
                            NumberFormat.simpleCurrency(
                                    locale: 'de-DE', decimalDigits: 2)
                                .format(totalIncome),
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_upward_rounded),
                    ],
                  ),
                  Row(children: [
                    const Icon(
                      Icons.arrow_downward_rounded,
                      semanticLabel: "Expense",
                    ),
                    Column(
                      children: [
                        const Text("Expense"),
                        Text(
                          NumberFormat.simpleCurrency(
                                  locale: 'de-DE', decimalDigits: 2)
                              .format(totalExpense),
                        ),
                      ],
                    )
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
