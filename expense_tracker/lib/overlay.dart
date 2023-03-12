import 'package:flutter/material.dart';
import 'package:expense_tracker/screens/home_screen.dart';
import 'package:expense_tracker/screens/charts.dart';
import 'package:expense_tracker/screens/new_expense.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List _pages = [
    [HomePage(), "Expenses"],
    [MyNewExpense(), "New Expense"],
    [MyCharts(), "Charts"]
  ];

  int selectedIndex = 0;
  void navigateToScreen(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex][0],
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        centerTitle: true,
        backgroundColor: Colors.amber[200],
        scrolledUnderElevation: 0,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: GNav(
          gap: 8,
          haptic: true,
          padding: const EdgeInsets.all(16),
          tabBackgroundColor: Colors.grey[200]!,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.add,
              text: 'New',
            ),
            GButton(
              icon: Icons.bar_chart,
              text: 'Charts',
            ),
          ],
          onTabChange: (index) {
            navigateToScreen(index);
          },
        ),
      ),
    );
  }
}
