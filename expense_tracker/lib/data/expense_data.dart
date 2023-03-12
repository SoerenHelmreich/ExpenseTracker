import 'dart:ui';

import 'package:expense_tracker/data/expense_type.dart';
import 'package:flutter/material.dart';

import '../helper_functions/date_time_conversion.dart';
import 'expense.dart';

class ExpenseData {
  //List of expenses
  List<Expense> allExpenses = [
    Expense(
      id: 0,
      title: 'Mensa',
      amount: 4.20,
      expenseTrue: true,
      expensenDateTime: DateTime(2023, 03, 02, 10, 22),
      type: ExpenseType(typeTitle: 'Essen', typeIcon: Icons.fastfood),
    ),
    Expense(
      id: 1,
      title: 'Kino',
      amount: 9.40,
      expenseTrue: true,
      expensenDateTime: DateTime(2023, 03, 03, 10, 22),
      type:
          ExpenseType(typeTitle: 'Freizeit', typeIcon: Icons.sports_basketball),
    ),
  ];

  //get Expenses
  List<Expense> getAllExpenses() {
    return allExpenses;
  }

  //get single Expense
  Expense getExpense(int index) {
    return allExpenses[index];
  }

  int getLastExpenseID() {
    return allExpenses.last.id;
  }

  //add new Expense
  void addNewExpense(Expense expense) {
    allExpenses.add(expense);
  }

  //update Expense
  void updateExpense(
    Expense expense,
    String newTitle,
    double newAmount,
    bool expenseTrue,
    ExpenseType newExpenseType,
  ) {
    //go through list to get relevant expense
    for (var i = 0; i < allExpenses.length; i++) {
      if (allExpenses[i].id == expense.id) {
        allExpenses[i].title = newTitle;
        allExpenses[i].amount = newAmount;
        allExpenses[i].expenseTrue = expenseTrue;
        allExpenses[i].type = newExpenseType;
      }
    }
  }

  double getTotalIncome() {
    double totalIncome = 0;

    for (var expense in allExpenses) {
      if (!expense.expenseTrue) {
        totalIncome += expense.amount;
      }
    }
    return totalIncome;
  }

  double getTotalExpense() {
    double totalExpense = 0;
    for (var expense in allExpenses) {
      if (expense.expenseTrue) {
        totalExpense += expense.amount;
      }
    }
    return totalExpense;
  }

  //delete Expense
  void deleteExpense(Expense expense) {
    allExpenses.remove(expense);
  }

  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    DateTime today = DateTime.now();

    for (var i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Mon') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {
      //date: (yyyymmdd) : amountTotalForDay
    };

    for (var expense in allExpenses) {
      String date = dateTimeToString(expense.expensenDateTime);
      double amount = expense.amount;

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        if (expense.expenseTrue) {
          currentAmount -= amount;
        } else {
          currentAmount += amount;
        }
      } else {
        double sign = 1;
        expense.expenseTrue ? sign = -1 : sign = 1;
        dailyExpenseSummary.addAll({date: sign * amount});
      }
    }
    return dailyExpenseSummary;
  }

  //take the Start of week in yyyymmdd and return a List of expenses from this week
  List<double> getWeekSummary(String StartOfWeekDate) {
    Map<String, double> dailyExpenseSummary = calculateDailyExpenseSummary();

    List<double> WeeklyExpenses = List.filled(7, 0);

    DateTime StartOfWeekDateTime = createDateTimeObject(StartOfWeekDate);

    for (var i = 0; i < 6; i++) {
      String dayInyyyymmdd =
          dateTimeToString(StartOfWeekDateTime.add(Duration(days: i)));
      WeeklyExpenses[i] = dailyExpenseSummary[dayInyyyymmdd] ?? 0;
    }
    return WeeklyExpenses;
  }
}
