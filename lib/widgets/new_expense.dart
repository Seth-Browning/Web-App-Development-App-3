
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});


  @override
  State<NewExpense> createState() {
    // TODO: implement createState
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text('Title')
            ),
          ),
          TextField(
            controller: _amountController,
            decoration: InputDecoration(
              prefixText: '\$ ',
              label: Text('Amount')
            ),
            keyboardType: TextInputType.number,
          ),
          Row(children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel')
            ),
            ElevatedButton(onPressed: () {
              print(_titleController.text);
              print(_amountController.text);
            }, child: Text('Save Expense')),
          ])
        ],
      ),
    );
  }
}