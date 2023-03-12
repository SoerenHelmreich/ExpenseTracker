import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/expense_type_card.dart';

class MyNewExpense extends StatefulWidget {
  const MyNewExpense({super.key});

  @override
  State<MyNewExpense> createState() => MyNnewExpenseState();
}

class MyNnewExpenseState extends State<MyNewExpense> {
  final _formKey = GlobalKey<FormState>();
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ExpenseTypeCard(
                    typeText: "Essen", typeIcon: Icons.fastfood);
              },
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.title),
                    hintText: 'What did you buy?',
                    labelText: 'Title',
                  ),
                  keyboardType: TextInputType.text,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.title),
                    hintText: 'What was the amount?',
                    labelText: 'Amount',
                  ),
                  keyboardType: TextInputType.number,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    return null;
                  },
                ),
                FormField(
                  builder: (field) {
                    return Switch(
                      value: switchValue,
                      onChanged: (value) => setState(() => switchValue = value),
                    );
                  },
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ]),
      ),
    );
  }
}
