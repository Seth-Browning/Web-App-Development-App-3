import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(
    this.expense, {
    super.key,
    required this.editExpenseOverlay,
    required this.onEditExpense,
  });

  final Expense expense;
  final void Function(Expense editedExpense) editExpenseOverlay;
  final void Function(Expense editedExpense, Expense newExpenseValues) onEditExpense;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        editExpenseOverlay(expense);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expense.title, style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 5),
              Row(
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}'),
                  Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      const SizedBox(width: 8),
                      Text(expense.formattedDate),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
