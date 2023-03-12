import 'package:flutter/material.dart';

class ExpenseTypeCard extends StatelessWidget {
  final String typeText;
  final IconData typeIcon;
  const ExpenseTypeCard(
      {super.key, required this.typeText, required this.typeIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        child: FloatingActionButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(typeIcon),
              Text(typeText),
            ],
          ),
        ),
      ),
    );
  }
}



/*

Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[700]!)),
        width: 70,
        child:
            Center(child: Column(children: [Text(typeText), Icon(typeIcon)])),
      ),
    );
*/