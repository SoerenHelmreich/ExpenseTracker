import 'package:expense_tracker/data/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200],
        ),
        padding: const EdgeInsets.all(24),
        child: Row(children: [
          Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                expense.type.typeIcon,
                color: Colors.grey[400],
              )),
          Text(
            expense.title,
            style: TextStyle(fontSize: 16),
          ),
          const Spacer(flex: 10),
          Text(
            expense.expenseTrue ? "-" : "+",
            style: TextStyle(
                color:
                    expense.expenseTrue ? Colors.red[600] : Colors.green[600]),
          ),
          Text(
            NumberFormat.currency(locale: 'de-DE', decimalDigits: 2)
                .format(expense.amount),
            style: TextStyle(
                color:
                    expense.expenseTrue ? Colors.red[600] : Colors.green[600]),
          ),
        ]),
      ),
    );
  }
}
