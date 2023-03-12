import 'expense_type.dart';

class Expense {
  int id;
  String title;
  double amount;
  ExpenseType type;
  bool expenseTrue;
  DateTime expensenDateTime;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.type,
    required this.expenseTrue,
    required this.expensenDateTime,
  });
}
