import 'package:expense_tracker/components/balance.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:flutter/material.dart';
import '../components/expense_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ExpenseData expenses = ExpenseData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyBalance(
              totalBalance:
                  expenses.getTotalIncome() - expenses.getTotalExpense(),
              totalExpense: expenses.getTotalExpense(),
              totalIncome: expenses.getTotalIncome()),
          Expanded(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: expenses.getAllExpenses().length,
                itemBuilder: (context, index) {
                  return ExpenseCard(
                    expense: expenses.getExpense(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
