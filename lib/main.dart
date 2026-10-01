import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(scaffoldBackgroundColor: const Color.fromARGB(255, 130, 13, 209)),
      home: Expenses()
    )
  );
}

